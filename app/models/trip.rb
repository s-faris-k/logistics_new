class Trip < ApplicationRecord
  belongs_to :client
  belongs_to :driver
  belongs_to :vehicle

  has_many :expenditures, as: :expenditurable


end
