class Article < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :blog
  validates :title, presence: true
end
