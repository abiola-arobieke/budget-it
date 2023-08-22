class ExpenseItem < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_items_categories, dependent: :destroy
  has_many :categories, through: :expense_items_categories

  # validations
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
end
