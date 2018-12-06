# This migration comes from reservation_vol (originally 20171107210731)
class CreateReservationVolBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_vol_bookings do |t|
      t.string :name
      t.references :reservation_vol_flight, foreign_key: true

      t.timestamps
    end
  end
end
