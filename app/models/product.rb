class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :price
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  scope :most_recent, -> { order("created_at DESC").limit(3) }
end
