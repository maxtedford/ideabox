class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates :title,
    presence: true
  validates :body,
    presence: true
  validates :user_id,
    presence: true
end
