# This migration comes from eventbrite (originally 20171103103428)
class CreateEventbriteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :eventbrite_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
