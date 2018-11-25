class CreateUniversResponseUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :univers_response_users do |t|
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
