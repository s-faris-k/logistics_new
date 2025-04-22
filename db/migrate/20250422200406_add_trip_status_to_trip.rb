class AddTripStatusToTrip < ActiveRecord::Migration[7.2]
  def change
    add_column :trips, :trip_status, :string
  end
end
