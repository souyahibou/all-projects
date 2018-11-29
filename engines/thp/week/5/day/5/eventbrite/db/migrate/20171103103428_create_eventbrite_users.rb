class CreateEventbriteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :eventbrite_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
