# This migration comes from base_de_donnees (originally 20171026194600)
class CreateBaseDeDonneesCours < ActiveRecord::Migration[5.1]
  def change
    create_table :base_de_donnees_cours, { id: false } do |t|
      t.string :titre
      t.text :description
      t.integer :id, primary_key: true
      
      t.timestamps
    end
  end
end
