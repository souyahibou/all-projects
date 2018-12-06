# This migration comes from reservation_vol (originally 20171106222223)
class CreateDirectJoinTableVolsAeroports < ActiveRecord::Migration[5.1]
  def change
    create_join_table :reservation_vol_flights, :reservation_vol_airports do |t|
       t.index [:reservation_vol_flight_id, :reservation_vol_airport_id], {:name => "index_airports_flights_on_flight_id_and_airport_id"}
       t.index [:reservation_vol_airport_id, :reservation_vol_flight_id], {:name => "index_airports_flights_on_airport_id_and_flight_id"}
    end
  end
end
