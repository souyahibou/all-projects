class AddPassword < ActiveRecord::Migration[5.1]
  def change

  	add_column :login_password_full_master_users, :password_digest, :string

  end
end
