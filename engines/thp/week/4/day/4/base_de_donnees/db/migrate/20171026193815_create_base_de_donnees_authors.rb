class CreateBaseDeDonneesAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :base_de_donnees_authors do |t|
      t.string :username
      t.string :email
      t.string :password


      t.timestamps
    end
  end
end
