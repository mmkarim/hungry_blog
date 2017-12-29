class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable
  acts_as_paranoid

  paginates_per Settings.post.page_limit
end
