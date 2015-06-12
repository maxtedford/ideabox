require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid" do
    swifty = User.new(username: "tswift", password: "password")
    
    expect(swifty).to be_valid
  end
  
  it "is invalid without a username" do
    swifty = User.new(password: "password")
    
    expect(swifty).not_to be_valid
  end
  
  it "is invalid without a password" do
    swifty = User.new(username: "twsift")
    
    expect(swifty).not_to be_valid
  end
  
  it "is invalid when the username has already been taken" do
    User.create(username: "tswift", password: "password")
    biebs = User.new(username: "tswift", password: "passy")
    
    expect(biebs).not_to be_valid
  end
end
