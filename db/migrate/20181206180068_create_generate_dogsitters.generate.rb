# This migration comes from generate (originally 20171103024933)
class CreateGenerateDogsitters < ActiveRecord::Migration[5.1]
  def change
    create_table :generate_dogsitters do |t|
      t.string :name

      t.timestamps
    end
  end
end
