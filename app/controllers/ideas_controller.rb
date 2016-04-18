class IdeasController < ApplicationController


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

  private

    def idea_params
      params.require(:idea).permit(:description, :category_id)
    end
end
