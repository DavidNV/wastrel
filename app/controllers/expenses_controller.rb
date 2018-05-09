class ExpensesController < ApplicationController
  def index
    puts request.headers.to_h.keys
    transaction_type = params["transaction_type"]
    category = params["category"]
    if transaction_type && !category
      @expenses = Expense.joins(:transaction_type)
                  .where("transaction_types.name = ?", transaction_type.capitalize).limit(10)

    elsif category && !transaction_type
      @expenses = Expense.joins(:category)
                  .where("categories.name = ?", category.capitalize).limit(10)

    elsif category && transaction_type
      @expenses = Expense.joins(:transaction_type, :category)
                   .where("transaction_types.name = ? AND categories.name = ?", transaction_type.capitalize, category.capitalize).limit(10)
    else
      @expenses = Expense.last(10)
    end
    @transaction_types = TransactionType.all
    @categories = Category.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses, status: :ok }
      format.js { puts params.inspect; render partial: "expenses_list", locals: { cositas: @expenses } }
    end
  end
end
