class CreateGenerateDogsitters < ActiveRecord::Migration[5.1]
  def change
    create_table :generate_dogsitters do |t|
      t.string :name

      t.timestamps
    end
  end
end
