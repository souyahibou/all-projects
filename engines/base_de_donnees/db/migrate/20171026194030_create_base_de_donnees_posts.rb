class CreateBaseDeDonneesPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :base_de_donnees_posts do |t|
      t.string :title
      t.text :body
      t.integer :author_id
      t.references :author, foreign_true: true
      t.timestamps
    end
  end
end
