# This migration comes from formulaire_stylay (originally 20171115232808)
class CreateFormulaireStylayUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :formulaire_stylay_users do |t|
      t.string :email
      t.integer :phone
      t.string :password

      t.timestamps
    end
  end
end
