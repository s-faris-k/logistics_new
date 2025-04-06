class Expenditure < ApplicationRecord
  belongs_to :expenditurable, polymorphic: true, optional: true
  belongs_to :vehicle, optional: true

  validates :title, :amount, presence: true
end
