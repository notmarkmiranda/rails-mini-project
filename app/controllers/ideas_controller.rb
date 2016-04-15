class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Successfully Created!"
      redirect_to @idea
    else
      flash.now[:error] = @idea.errors.full_messages.join(", ")
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
    if @idea.update(idea_params)
      flash[:notice] = "Idea Successfully Updated!"
      redirect_to @idea
    else
      flash.now[:error] = @idea.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    flash[:notice] = "Idea Successfully Deleted!"
    redirect_to ideas_path
  end

  private

    def idea_params
      params.require(:idea).permit(:description)
    end
end
