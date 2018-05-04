class ExpensesController < ApplicationController
  def index
    transaction_type = params[:transaction_type]
    category = params[:category]
    puts "\n*" * 5
    puts params.inspect
    @expenses = Expense.first(10)
    @transaction_types = TransactionType.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses, status: :ok }
    end
  end
end
