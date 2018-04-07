class AddCategoryReferenceOnExpense < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :categories, foreign_key: true
  end
end
