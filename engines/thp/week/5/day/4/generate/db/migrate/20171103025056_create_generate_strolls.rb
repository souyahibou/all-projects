class CreateGenerateStrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :generate_strolls do |t|
      t.references :generate_dogsitter, foreign_key: true
      t.references :generate_dog, foreign_key: true

      t.timestamps
    end
  end
end
