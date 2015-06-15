require 'rails_helper'

RSpec.describe Idea, type: :model do
  
  let(:swifty) { User.create(username: "tswift", password: "password") }
  let(:songs) { Category.create(name: "Songs") }
  
  it "is valid" do
    style = swifty.ideas.create(title: "Style", body: "We'll never go out of style. Out! Of! Style!", user_id: swifty.id)
    
    expect(style).to be_valid
  end
  
  it "is invalid without a title" do
    style = swifty.ideas.create(body: "We'll never go out of style. Out! Of! Style!", user_id: swifty.id)
    
    expect(style).not_to be_valid
  end
  
  it "is invalid without a body" do
    style = swifty.ideas.create(title: "Style", user_id: swifty.id)
    
    expect(style).not_to be_valid
  end
  
  it "is invalid without a user_id" do
    style = Idea.new(title: "Style", body: "We'll never go out of style. Out! Of! Style!")
    
    expect(style).not_to be_valid
  end
  
  it "is associated with a user" do
    style = swifty.ideas.create(title: "Style", body: "We'll never go out of style. Out! Of! Style!", user_id: swifty.id)

    expect(style.user.username).to eq("tswift")
    expect(style.user.id).to eq(1)
  end
  
  it "is associated with a category" do
    style = songs.ideas.create(title: "Style", body: "We'll never go out of style. Out! Of! Style!", user_id: swifty.id)
    
    expect(style.category.name).to eq("Songs")
    expect(style.category.id).to eq(1)
  end
end
