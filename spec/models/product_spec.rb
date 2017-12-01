require "rails_helper"

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(1) }

  it { should have_many :reviews }

  describe '.most_recent' do
    it "returns the three most recently created products" do
      p1 = FactoryBot.create(:product)
      p2 = FactoryBot.create(:product)
      p3 = FactoryBot.create(:product)
      p4 = FactoryBot.create(:product)
      expect(Product.most_recent).to eq([p4, p3, p2])
    end
  end
end
