class AddPasswordDigestUniversResponseUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :univers_response_users, :password_digest, :string
  end
end
