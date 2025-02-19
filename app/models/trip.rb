class Trip < ApplicationRecord
  belongs_to :client
  belongs_to :driver
  belongs_to :vehicle
end
