class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @expense_items_categories = @category.expense_items_categories.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def create
    puts category_params
    @category = Category.new(category_params)
    @category.author = current_user

    if @category.save
      redirect_to categories_path, notice: 'Category has been created.'
    else
      flash.now[:alert] = 'Error! Unable to create a category.'
      render :new
    end
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category has been updated.'
    else
      flash.now[:alert] = 'Error! Unable to create a category.'
      render :edit, status: :unprocesseable_entity
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy!
    redirect_to categories_path, notice: 'Successfully deleted category.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
