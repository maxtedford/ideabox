# require 'rails_helper'
#
# describe "registered admin user edits categories", type: :feature do
#
#   it "allows an admin user to edit a category" do
#   admin = User.create(username: "chelsea",
#                       password: "password",
#                           role: 1)
#   visit users_path
#   click_link("Login")
#   fill_in "Username", with: "chelsea"
#   fill_in "Password", with: "password"
#   click_button "Login"
#
#   click_link("Categories")
#   click_link("sample")
#
#   fill_in "Name", with: "new sample"
#   click_button "Update"
#
#   expect(current_path).to eq(admin_category_path(admin))
#   assert page.has_content?("new sample")
#   reset_session!
#   end
# end
