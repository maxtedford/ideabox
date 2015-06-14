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
  
  def edit
    @idea = Idea.find(params[:id])
  end
  
  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    
    flash.notice = "Idea '#{@idea.title}' has been updated!"
    redirect_to @idea
  end
  private
  
  def idea_params
    params.require(:idea).permit(:title, :body, :user_id)
  end
end
