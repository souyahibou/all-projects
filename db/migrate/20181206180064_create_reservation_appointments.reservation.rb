# This migration comes from reservation (originally 20171103003451)
class CreateReservationAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_appointments do |t|
      t.datetime :date
      t.references :reservation_doctor, foreign_key: true
      t.references :reservation_patient, foreign_key: true

      t.timestamps
    end
  end
end
