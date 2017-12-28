class Post < ApplicationRecord
  acts_as_taggable
  paginates_per 1
end
