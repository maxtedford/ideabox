require 'rails_helper'

describe "user logs out of account", type: :feature do

  it "logs a user out of their account" do
    swifty = User.create(username: "tswift",
                         password: "password")

    visit users_path
    click_link("Login")
    fill_in "Username", with: "tswift"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(user_path(swifty))
    assert page.has_content?("Welcome tswift")

    click_link "Logout"
    expect(current_path).to eq(users_path)
    assert page.has_content?("Welcome to IdeaBox")

    reset_session!
  end
end
