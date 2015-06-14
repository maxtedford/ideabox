class Category < ActiveRecord::Base
  has_many :ideas
  belongs_to :user #not 100% sure about this relationship 
end
