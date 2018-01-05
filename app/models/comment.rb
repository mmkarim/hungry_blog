class Comment < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :post

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}
  validates :text, presence: true

  acts_as_paranoid

  def add_pretty_time
    self.attributes.merge(time: time_ago_in_words(self.created_at))
  end
end
