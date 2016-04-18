  class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]

    def index
      # byebug
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
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:notice] = "Category Successfully Updated!"
        redirect_to categories_path
      else
        flash.now[:error] = @category.errors.full_messages.join(", ")
        render :edit
      end
    end

    def show

      # byebug
      @admin = current_user.admin?
      @category = Category.find(params[:id])
    end

    def destroy
      flash[:notice] = "Category Successfully Deleted!"
      category = Category.find(params[:id])
      category.destroy
      redirect_to categories_path
    end

    private
      def category_params
        params.require(:category).permit(:name)
      end
  end
