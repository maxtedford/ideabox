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
end


# As a Registered Admin...

# When I visit the root path, click "Login",
# then fill in the form and click "Login"...

# I expect to be presented with my '/show' page
# which contains all my ideas,
# plus a "categories" link and an "images" link.
