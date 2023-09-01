class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_items_categories, dependent: :destroy
  has_many :expense_items, through: :expense_items_categories

  # validations
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :icon, presence: true
  validates :author_id, presence: true
end
