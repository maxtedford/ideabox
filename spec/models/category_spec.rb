require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it "is valid" do
    category = Category.new(name: "Songs")
    
    expect(category).to be_valid
  end
  
  it "is invalid without a name" do
    category = Category.new()
    
    expect(category).not_to be_valid
  end
  
  it "has ideas" do
    user = User.create(username: "tswift", password: "password")
    category = Category.create(name: "Songs")
    category.ideas.create(title: "Style", body: "We'll never go out of style!", user_id: user.id)
    
    expect(category.ideas.first.title).to eq("Style")
  end
end
