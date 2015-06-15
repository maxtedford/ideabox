require 'rails_helper'

describe "user updates existing idea", type: :feature do

  xit "updates a user's existing idea" do
    swifty = User.create(username: "tswift", password: "password")
    idea = swifty.ideas.create(title: "Style", body: "We'll never go out of style...Out! Of! Style!", user_id: swifty.id)

    visit users_path
    click_link "Login"
    fill_in "Username", with: "tswift"
    fill_in "Password", with: "password"
    click_button "Edit Idea"
    fill_in "Title", with: "Feeling 22"
    click_button "Update Idea"

    expect(current_path).to eq(idea)
    assert page.has_content?("Idea 'Feeling 22' has been updated!")
    assert page.has_link?("Feeling 22")
  end
end
