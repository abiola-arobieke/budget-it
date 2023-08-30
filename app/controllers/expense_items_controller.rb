class ExpenseItemsController < ApplicationController
  def index
    @expense_items = current_user.expense_items.order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:category_id])
    @expense_item = current_user.expense_items.find(params[:id])
  end

  def new
    @expenseitem = ExpenseItem.new
    @category = Category.find(params[:category_id])
  end

  def create
    @expense_item = ExpenseItem.new(expense_item_params)
    @expense_item.author = current_user
    @category = Category.find(params[:category_id])

    if @expense_item.save
      @expense_category = ExpenseItemsCategory.create(expense_item: @expense_item, category: @category)
      redirect_to category_path(@category), notice: 'Expense item has been created.'
    else
      flash.now[:alert] = 'Error! Unable to create a expense item.'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @expenseitem = current_user.expense_items.find(params[:id])
  end

  def update
    @expenseitem = current_user.expense_items.find(params[:id])
    if @expenseitem.update(expense_item_params)
      redirect_to category_expense_item_path(params[:category_id], params[:id]),
                  notice: 'Expense item has been updated.'
    else
      flash.now[:alert] = 'Error! Unable to modify expense item.'
      render :edit
    end
  end

  def destroy
    @expense_item = current_user.expense_items.find(params[:id])

    if @expense_item.destroy
      redirect_to category_path(params[:category_id]), notice: 'Expense item has been updated.'
    else
      flash.now[:alert] = 'Error! Unable to modify expense item.'
      render :show
    end
  end

  private

  def expense_item_params
    params.require(:expense_item).permit(:name, :amount, :category_id)
  end
end
