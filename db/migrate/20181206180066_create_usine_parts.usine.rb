# This migration comes from usine (originally 20171103015529)
class CreateUsineParts < ActiveRecord::Migration[5.1]
  def change
    create_table :usine_parts do |t|
      t.string :part_number

      t.timestamps
    end
  end
end
