class Expense < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
