class CreateReFormerUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :re_former_users do |t|
      t.string :username
      t.string :email
      t.string :bio

      t.timestamps
    end
  end
end
