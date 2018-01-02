require 'elasticsearch/model'

class Post < ApplicationRecord
  extend FriendlyId
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :comments, dependent: :delete_all

  validates :title, presence: true

  friendly_id :title, use: :slugged

  acts_as_taggable
  acts_as_paranoid

  paginates_per Settings.post.page_limit

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            body: {}
          }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english'
      indexes :body, analyzer: 'english'
    end
  end
end

# Delete the previous Posts index in Elasticsearch
Post.__elasticsearch__.client.indices.delete index: Post.index_name rescue nil

# Create the new index with the new mapping
Post.__elasticsearch__.client.indices.create \
  index: Post.index_name,
  body: { settings: Post.settings.to_hash, mappings: Post.mappings.to_hash }

# Index all Post records from the DB to Elasticsearch
Post.import
