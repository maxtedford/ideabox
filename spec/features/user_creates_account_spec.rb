require 'rails_helper'

describe "user creates account", type: :feature do

  it "presents user with a welcome page" do
  visit users_path

  assert page.has_content?("Welcome to IdeaBox")
  assert page.has_link?("Create Account")
  assert page.has_link?("Login")
  end

  it "creates a new account" do
  visit users_path
  click_link("Create Account")
  fill_in "Username", with: "tswift"
  fill_in "Password", with: "password"
  click_button "Create Account"

  assert page.has_content?("Welcome tswift")
  expect(User.all.count).to eq(1)
  reset_session!
  end

  it "creates a new account with errors" do
  visit users_path
  click_link("Create Account")
  fill_in "Username", with: ""
  fill_in "Password", with: ""
  click_button "Create Account"

  assert page.has_content?("Missing Login Information!")
  reset_session!
  end

end

# As an Unregistered User...
#
# When I visit the root path, click "Create New Account",
# then fill in the form with non-text in both the username and password fields,
# and click "Create Account",
#
# I expect to be presented with a flash error that
# I've entered invalid information and redirected to the create account page
