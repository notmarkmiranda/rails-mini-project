class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Successfully Created!"
      redirect_to @category
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
