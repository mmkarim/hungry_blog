class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_taggable
  paginates_per 10
end
