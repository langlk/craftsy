class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :price
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
