require 'rails_helper'

describe "user creates account", type: :feature do
  
  it "logs a user into their account" do
    swifty = User.create(username: "tswift",
                         password: "password")
    
    visit users_path
    click_link("Login")
    fill_in "Username", with: "tswift"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(user_path(swifty))
    assert page.has_content?("Welcome tswift")
    reset_session!
  end

  it "throws an error when user tries to login with invalid username" do
    User.create(username: "tswift",
                password: "password")
    
    visit users_path
    click_link("Login")
    fill_in "Username", with: "swifty"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(login_path)
    assert page.has_content?("Invalid login credentials. Please try again")
    reset_session!
  end

  it "throws an error when user tries to login with invalid password" do
    User.create(username: "tswift",
                password: "password")
    
    visit users_path
    click_link("Login")
    fill_in "Username", with: "tswift"
    fill_in "Password", with: "passy"
    click_button "Login"

    expect(current_path).to eq(login_path)
    assert page.has_content?("Invalid login credentials. Please try again")
    reset_session!
  end
end
