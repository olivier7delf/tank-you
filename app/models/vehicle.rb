class Vehicle < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :category, presence: true
  validates :daily_price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  CATEGORIES = ["air", "terre", "mer", "espace"]
end
