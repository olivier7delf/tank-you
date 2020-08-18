class Vehicle < ApplicationRecord
  has_many :orders
  has_many_attached :photos

  validates :name, presence: true
  validates :category, presence: true
  validates :daily_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  CATEGORIES = ["air", "terre", "mer", "espace"]
end
