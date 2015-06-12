require 'rails_helper'

describe "user creates account", type: :feature do
  
  it "logs a user into their account" do
    User.create(username: "tswift",
                password: "password")
    
    visit users_path
    click_link("Login")
    fill_in "Username", with: "tswift"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome tswift")
    reset_session!
  end
end
