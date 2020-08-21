class Review < ApplicationRecord
  belongs_to :vehicle

  validates :comment, length: { minimum: 20 }
end
