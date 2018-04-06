require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do
    it "should belong to a user" do
      time = Time.now.freeze
      user = User.create(email: "david.nvalderrama@gmail.com")
      user.inspect
      expense = Expense.new(amount: 30000, concept: "Uber", date: time, user_id: user.id)
      expect(expense.valid?).to eq(true)
    end
  end
end
