class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :price
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "300x300#" }, :default_url => "/images/:style/missing.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  scope :most_recent, -> { order("created_at DESC").limit(3) }
end
