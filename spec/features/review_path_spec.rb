require "rails_helper"

describe "the review management path" do
  before do
    @review = FactoryBot.create(:review)
    @product = @review.product
    @user = FactoryBot.create(:user, name: "New User", email: "user@user.com")
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Log in"
  end

  it "allows all authenticated users to leave reviews on a product" do
    visit product_path(@product)
    fill_in "Rating", with: 3
    fill_in "Comments", with: "This is a new test review!"
    click_button "Save"
    expect(page).to have_content("This is a new test review!")
  end

  it "allows authenticated users to edit their own reviews" do
    review = FactoryBot.create(:review, product: @product, user: @user, comments: "Text to edit.")
    visit product_path(@product)
    click_link "Edit"
    fill_in "Comments", with: "New review comment text."
    click_button "Save"
    expect(page).to have_content("New review comment text.")
    expect(page).to have_no_content("Text to edit.")
  end

  it "allows authenticated users to delete their own reviews" do
    review = FactoryBot.create(:review, product: @product, user: @user, comments: "This review will be deleted.")
    visit product_path(@product)
    click_link "Delete"
    expect(page).to have_no_content("This review will be deleted.")
  end

  it "allows admins to delete any reviews" do
    @user.update(admin: true)
    visit product_path(@product)
    click_link "Delete"
    expect(page).to have_no_content("This is an example review text.")
  end

  it "does not allow unauthenticated users to add a review" do
    click_on "Sign Out"
    visit product_path(@product)
    expect(page).to have_no_content("Add a Review")
  end

  it "does not allow users to edit other users' reviews" do
    visit edit_product_review_path(@product, @review)
    expect(page).to have_content("You aren't authorized to do that.")
    expect(page).to have_no_content("Edit Review")
  end

  it "does not allow basic users to delete other users' reviews" do
    Capybara.current_session.driver.submit :delete, product_review_path(@product, @review), nil
    expect(page).to have_content("You aren't authorized to do that.")
    expect(page).to have_content("This is an example review text.")
  end

end
