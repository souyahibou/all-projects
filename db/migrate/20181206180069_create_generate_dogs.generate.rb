# This migration comes from generate (originally 20171103024945)
class CreateGenerateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :generate_dogs do |t|
      t.string :race

      t.timestamps
    end
  end
end
