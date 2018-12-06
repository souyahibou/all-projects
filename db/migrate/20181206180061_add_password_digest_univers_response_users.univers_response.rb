# This migration comes from univers_response (originally 20171031151228)
class AddPasswordDigestUniversResponseUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :univers_response_users, :password_digest, :string
  end
end
