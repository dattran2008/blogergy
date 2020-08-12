class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category was created successfully!'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles
  end

  def edit
    if !logged_in? || (current_user and !current_user.admin?)
      flash[:danger] = "You don't have permission to do this"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Updated category successfully!'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
