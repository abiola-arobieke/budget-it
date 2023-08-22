class CreateExpenseItemsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_items_categories do |t|
      t.references :expense_item, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
