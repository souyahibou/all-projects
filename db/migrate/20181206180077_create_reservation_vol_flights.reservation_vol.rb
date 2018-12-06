# This migration comes from reservation_vol (originally 20171106190101)
class CreateReservationVolFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_vol_flights do |t|
      t.integer :duration
      t.datetime :departure_date
      # t.references :departure_airport, foreign_key: true
      # t.references :arrival_airport, foreign_key: true
      t.references :reservation_vol_departure_airport, foreign_key: false, index: { :name => "index_flights_on_departure_airport_id"}
      t.references :reservation_vol_arrival_airport, foreign_key: false, index: { :name => "index_flights_on_arrival_airport_id"}

      t.timestamps
    end
  end
end
