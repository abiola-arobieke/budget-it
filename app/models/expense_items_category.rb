class ExpenseItemsCategory < ApplicationRecord
  belongs_to :expense_item
  belongs_to :category

  validates :expense_item_id, presence: true
  validates :category_id, presence: true
end
