class IdeasController < ApplicationController
  before_action :current_user

  def new
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.new
  end

  def create
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Successfully Created!"
      redirect_to category_idea_path(@category, @idea)
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
    @category = Category.find(@idea.category_id)
  end

  def update
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
    if @idea.update(idea_params)
      flash[:notice] = "Idea Successfully Updated!"
      redirect_to @category
    else
      flash.now[:error] = @idea.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    category = Category.find(idea.category_id)
    idea.destroy
    flash[:notice] = "Idea Successfully Deleted!"
    redirect_to category_path(category)
  end

  private

    def idea_params
      params.require(:idea).permit(:description, :category_id)
    end
end
