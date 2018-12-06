# This migration comes from reservation (originally 20171103003303)
class CreateReservationPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_patients do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
