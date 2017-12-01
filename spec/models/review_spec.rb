require "rails_helper"

describe Review do
  it { should validate_presence_of :user }
  it { should validate_presence_of :product }
  it { should validate_presence_of :comments }
  it { should validate_presence_of :rating }
  it { should validate_numericality_of(:rating)
    .is_greater_than_or_equal_to(1)
    .is_less_than_or_equal_to(5)
  }

  it { should belong_to :user }
  it { should belong_to :product }
end
