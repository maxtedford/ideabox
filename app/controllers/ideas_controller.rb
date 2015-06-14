class IdeasController < ApplicationController
  
  def new
    @idea = Idea.new(user_id: params[:user_id])
  end
  
  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea.user, notice: "Idea successfully added!"
    else
      flash.notice = "Invalid entry. Please try again."
      render :new
    end
  end
  
  def show
    @idea = Idea.find(params[:id])
  end
  
  private
  
  def idea_params
    params.require(:idea).permit(:title, :body, :user_id)
  end
end
