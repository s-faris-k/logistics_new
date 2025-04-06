class Trip < ApplicationRecord
  belongs_to :client
  belongs_to :driver
  belongs_to :vehicle

  has_many :expenditures, as: :expenditurable

  validates :date, :start_km, :end_km, :start_loc, :end_loc, presence: true
end
