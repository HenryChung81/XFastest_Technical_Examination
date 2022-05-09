class Blog < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :name, presence: true
  has_many :articles, :dependent => :destroy
end
