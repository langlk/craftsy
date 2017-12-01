require "rails_helper"

describe "the user management path" do
  it "stores a username in addition to default Devise attributes" do
    visit "users/sign_up"
    fill_in "Email", with: "test@test.com"
    fill_in "Name", with: "Test User Name"
    fill_in "Password", with: "test1234"
    fill_in "Password confirmation", with: "test1234"
    click_on "Sign up"
    expect(page).to have_content("Test User Name")
  end
end
