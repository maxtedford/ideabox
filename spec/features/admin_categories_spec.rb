require 'rails_helper'

describe "registered admin user", type: :feature do
  #
  # it "presents logged in admin with index page" do
  # admin = User.create(username: "admin",
  #                     password: "password",
  #                         role: 1)
  # visit admin_users_path
  #
  # expect(current_path).to eq(admin_users_path)
  # assert page.has_content?("Welcome admin")
  # reset_session!
  # end

  it "presents logged in admin with user show page" do
  admin = User.create(username: "chelsea",
                      password: "password",
                          role: 1)
  visit users_path
  click_link("Login")
  fill_in "Username", with: "chelsea"
  fill_in "Password", with: "password"
  click_button "Login"

  expect(current_path).to eq(admin_user_path(admin))
  assert page.has_content?("Welcome chelsea")
  reset_session!
  end

  it "allows an admin user to create a category" do
  admin = User.create(username: "chelsea",
                      password: "password",
                          role: 1)
  visit users_path
  click_link("Login")
  fill_in "Username", with: "chelsea"
  fill_in "Password", with: "password"
  click_button "Login"

  click_link("Categories")
  click_link("Add New Category")
  fill_in "Name", with: "Ideas"
  click_button "Create Category"
  save_and_open_page
  expect(current_path).to eq(category_path(admin))
  assert page.has_content?("Ideas")
  reset_session!
  end
end
