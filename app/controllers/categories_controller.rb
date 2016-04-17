class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Successfully Updated!"
      redirect_to categories_path
    else
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
