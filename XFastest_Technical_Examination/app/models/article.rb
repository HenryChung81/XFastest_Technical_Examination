class Article < ApplicationRecord
  acts_as_paranoid

  has_rich_text :action_content

  include AASM

  # validations
  validates :title, presence: true

  # relationships
  belongs_to :user
  belongs_to :blog
  has_one_attached :cover_image


  # instance methods
  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

end
