class AddTransactionTypeReferenceOnExpense < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :transaction_type, foreign_key: true
  end
end
