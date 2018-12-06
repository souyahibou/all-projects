# This migration comes from reservation_vol (originally 20171107205840)
class CreateJoinTablePassengersBookings < ActiveRecord::Migration[5.1]
  def change
    create_join_table :reservation_vol_passengers, :reservation_vol_bookings  do |t|
       t.index [:reservation_vol_passenger_id, :reservation_vol_booking_id], {:name => "index_bookings_passengers_on_passenger_id_and_booking_id"}
       t.index [:reservation_vol_booking_id, :reservation_vol_passenger_id], {:name => "index_passengers_bookings_on_booking_id_and_passenger_id"}
    end
  end
end
