# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


module ReservationVol
    Airport.destroy_all
    Flight.destroy_all

    Airport.create airport_code:"LHR", airport_name:"Aéroport de Londres-Heathrow ", airport_city:"Londres"
    Airport.create airport_code:"CDG", airport_name:"Aéroport de Paris-Charles-de-Gaulle", airport_city:"Nord-Paris"
    Airport.create airport_code:"FRA", airport_name:"Aéroport de Francfort-sur-le-Main", airport_city:"Francforts"
    Airport.create airport_code:"IST", airport_name:"Aéroport Atatürk", airport_city:"Istanbul"
    Airport.create airport_code:"AMS", airport_name:"Aéroport d'Amsterdam-Schiphol", airport_city:"Amsterdam"
    Airport.create airport_code:"MAD", airport_name:"Aéroport Adolfo-Suárez de Madrid-Barajas", airport_city:"Madrid"
    Airport.create airport_code:"MUC", airport_name:"v", airport_city:"Munich"
    Airport.create airport_code:"FCO", airport_name:"Aéroport Léonard-de-Vinci de Rome FiumicinoFCO", airport_city:"Rome"
    Airport.create airport_code:"LGW", airport_name:"Aéroport de Londres-Gatwick", airport_city:"Londres"
    Airport.create airport_code:"BCN", airport_name:"Aéroport de Barcelone-El Prat", airport_city:"Barcelone"



    100.times do
        da = ((1..10).to_a).sample
        aa = ((1..10).to_a).sample
        Flight.create duration:((10..1000).to_a).sample,  departure_airport_id: da,  arrival_airport_id: aa,  departure_date:Faker::Date.between(Date.today,7.days.from_now), departure_airport: Airport.find(da), arrival_airport: Airport.find(aa)
    end

    Booking.create reservation_vol_flight_id:((1..100).to_a).sample

    print "Success there are #{Airport.all.count} airports and #{Flight.all.count} flights created"
end
#
# ReservationVol::Airport.destroy_all
# ReservationVol::Flight.destroy_all
#
# ReservationVol::Airport.create airport_code:"LHR", airport_name:"Aéroport de Londres-Heathrow ", airport_city:"Londres"
# ReservationVol::Airport.create airport_code:"CDG", airport_name:"Aéroport de Paris-Charles-de-Gaulle", airport_city:"Nord-Paris"
# ReservationVol::Airport.create airport_code:"FRA", airport_name:"Aéroport de Francfort-sur-le-Main", airport_city:"Francforts"
# ReservationVol::Airport.create airport_code:"IST", airport_name:"Aéroport Atatürk", airport_city:"Istanbul"
# ReservationVol::Airport.create airport_code:"AMS", airport_name:"Aéroport d'Amsterdam-Schiphol", airport_city:"Amsterdam"
# ReservationVol::Airport.create airport_code:"MAD", airport_name:"Aéroport Adolfo-Suárez de Madrid-Barajas", airport_city:"Madrid"
# ReservationVol::Airport.create airport_code:"MUC", airport_name:"v", airport_city:"Munich"
# ReservationVol::Airport.create airport_code:"FCO", airport_name:"Aéroport Léonard-de-Vinci de Rome FiumicinoFCO", airport_city:"Rome"
# ReservationVol::Airport.create airport_code:"LGW", airport_name:"Aéroport de Londres-Gatwick", airport_city:"Londres"
# ReservationVol::Airport.create airport_code:"BCN", airport_name:"Aéroport de Barcelone-El Prat", airport_city:"Barcelone"
#
#
#
# 1.times do
#     da = ((1..10).to_a).sample
#     aa = ((1..10).to_a).sample
#     ReservationVol::Flight.create duration:((10..1000).to_a).sample,  reservation_vol_departure_airport_id: da,  reservation_vol_arrival_airport_id: aa,  departure_date:Faker::Date.between(Date.today,7.days.from_now), reservation_vol_departure_airport: ReservationVol::Airport.find(da), reservation_vol_arrival_airport: ReservationVol::Airport.find(aa)
# end
#
#
# ReservationVol::Booking.create flight_id:((1..100).to_a).sample
#
#
# print "Success there are #{ReservationVol::Airport.all.count} airports and #{ReservationVol::Flight.all.count} flights created"
