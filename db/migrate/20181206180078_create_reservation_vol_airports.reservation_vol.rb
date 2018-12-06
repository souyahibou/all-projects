# This migration comes from reservation_vol (originally 20171106190243)
class CreateReservationVolAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_vol_airports do |t|
      t.string :airport_code
      t.string :airport_name
      t.string :airport_city

      t.timestamps
    end
  end
end
