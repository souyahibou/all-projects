class CreateLoginPasswordFullMasterUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :login_password_full_master_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
