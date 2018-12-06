# This migration comes from reservation_vol (originally 20171107205620)
class CreateReservationVolPassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_vol_passengers do |t|
      t.string :name

      t.timestamps
    end
  end
end
