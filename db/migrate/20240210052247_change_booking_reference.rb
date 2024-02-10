class ChangeBookingReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :shelter, index: true, foreign_key: true
    add_reference :bookings, :bed, index: true, foreign_key: true
  end
end
