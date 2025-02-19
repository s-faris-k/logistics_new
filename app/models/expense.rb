class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :driver
  belongs_to :trip
end
