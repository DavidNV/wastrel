class Expense < ApplicationRecord
  validates :user_id, presence: true
end
