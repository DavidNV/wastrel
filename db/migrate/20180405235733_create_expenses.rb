class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |expense|
      expense.float :amount, null: false
      expense.string :concept, null: false
      expense.datetime :date, null: false
      expense.references :user, foreign_key: true, null: false

      expense.timestamps
    end
  end
end
