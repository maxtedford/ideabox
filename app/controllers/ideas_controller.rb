class IdeasController < ApplicationController
  
  def new
    @idea = Idea.new(user_id: params[:user_id])
  end
  
  def create
    
  end
end
