require 'rails_helper'

describe "user updates existing idea", type: :feature do

  xit "deletes a user's existing idea" do
    swifty = User.create(username: "tswift", password: "password")
    swifty.ideas.create(title: "Style", body: "We'll never go out of style...Out! Of! Style!")

    visit user_path(swifty)
    
    assert page.has_content?("Style")
    
    click_link "Delete"
    
    expect(current_path).to eq(swifty)
    refute page.has_content?("Idea 'Feeling 22' has been updated!")
    refute page.has_link?("Feeling 22")
    expect(swifty.ideas.count).to eq(0)
  end
end
