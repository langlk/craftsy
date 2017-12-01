require "rails_helper"

describe Review do
  it { should validate_presence_of :user }
  it { should validate_presence_of :product }
  it { should validate_presence_of :comments }
  it { should validate_presence_of :rating }

  it { should belong_to :user }
  it { should belong_to :product }
end
