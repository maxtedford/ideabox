require 'rails_helper'

describe 'user adds new idea', type: :feature do
  include Capybara::DSL
  
  it "user dashboard includes a new idea link" do
    swifty = User.create(username: "tswift", password: "password")
    
    visit user_path(swifty)
    click_link("Add New Idea")
    fill_in "Title", with: "Style"
    fill_in "Body", with: "We'll never go out of style...out! of! style!"
    click_button "Create Idea"
    
    expect(current_path).to eq(user_path(swifty))
    assert page.has_content?("Style")
  end
end
