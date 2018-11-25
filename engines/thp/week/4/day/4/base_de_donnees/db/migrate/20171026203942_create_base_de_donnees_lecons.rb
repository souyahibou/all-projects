class CreateBaseDeDonneesLecons < ActiveRecord::Migration[5.1]
  def change
    create_table :base_de_donnees_lecons do |t|
      t.string :titre
      t.text :body

      t.timestamps
    end
  end
end
