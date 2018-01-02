class Comment < ApplicationRecord
  belongs_to :post

  validates :email, presence: true
  validates :text, presence: true

  acts_as_paranoid
end
