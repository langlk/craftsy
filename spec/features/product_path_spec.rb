require "rails_helper"

describe "the product management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on "Log in"
  end

  it "allows all users to view product details" do
    product = FactoryBot.create(:product)
    visit root_path
    click_on 'Sign Out'
    visit products_path
    click_on "Test Product"
    expect(page).to have_content("An example craft for Craftsy.")
  end

  it "allows an admin to create a new product" do
    @user.update(admin: true)
    visit products_path
    click_on "Add a Craft"
    fill_in "Name", with: "New Craft"
    fill_in "Description", with: "A new craft."
    fill_in "Price", with: 10
    click_button "Save"
    expect(page).to have_content("New Craft")
  end

  it "allows an admin to edit a product" do
    product = FactoryBot.create(:product)
    @user.update(admin: true)
    visit product_path(product)
    click_on "Edit Craft"
    fill_in "Name", with: "New Craft"
    click_button "Save"
    expect(page).to have_no_content("Test Product")
    expect(page).to have_content("New Craft")
  end

  it "allows an admin to delete a product" do
    product = FactoryBot.create(:product)
    @user.update(admin: true)
    visit product_path(product)
    click_on "Delete Craft"
    expect(page).to have_no_content("Test Product")
  end

  it "does not allow a non-admin to add products"  do
    visit new_product_path
    expect(page).to have_no_content("Add a Craft")
    expect(page).to have_content("You aren't authorized to do that.")
  end

  it "does not allow a non-admin to edit products"  do
    product = FactoryBot.create(:product)
    visit edit_product_path(product)
    expect(page).to have_no_content("Edit Craft")
    expect(page).to have_content("You aren't authorized to do that.")
  end
end
