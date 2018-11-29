class CreateEventbriteEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :eventbrite_events do |t|
      t.text :description
      t.datetime :date
      t.string  :place
      t.integer :creator_id

      t.timestamps
    end
  end
end
