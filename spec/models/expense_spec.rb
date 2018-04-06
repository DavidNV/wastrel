require 'rails_helper'

RSpec.describe Expense, type: :model do
  context "The expense exists" do

    it "should belong to a user" do
      time = Time.now.freeze
      user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
      expense_1 = Expense.new(amount: 30000, concept: "Uber", date: time, user: user_1)

      expect(expense_1.valid?).to eq(true)
      expect(expense_1.save!).to eq(true)
      expect(Expense.count).to eq(1)
      expect(user_1.expenses).to eq([expense_1])
      expect(expense_1.user).to eq(user_1)
    end


    context "amount related" do
      before do
        time = Time.now.freeze
        user_1 = User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6))
        @expense_1 = Expense.new(amount: 0, concept: "Uber", date: time, user: user_1)
      end

      context "the amount is negative" do
        it "should not save the expense" do
          @expense_1.amount = -200
          expect(@expense_1.valid?).to be_falsey
          expect(@expense_1.save).to be_falsey
        end
      end

      context "the amount is positive" do
        it "should save the expense" do
        end
      end
    end
  end
end
