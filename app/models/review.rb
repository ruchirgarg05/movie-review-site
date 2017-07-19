class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 1..7
end
