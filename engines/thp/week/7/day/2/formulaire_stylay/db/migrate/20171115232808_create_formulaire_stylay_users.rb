class CreateFormulaireStylayUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :formulaire_stylay_users do |t|
      t.string :email
      t.string :phone
      t.string :password

      t.timestamps
    end
  end
end
