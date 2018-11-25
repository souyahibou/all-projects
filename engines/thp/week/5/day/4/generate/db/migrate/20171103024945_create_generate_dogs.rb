class CreateGenerateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :generate_dogs do |t|
      t.string :race

      t.timestamps
    end
  end
end
