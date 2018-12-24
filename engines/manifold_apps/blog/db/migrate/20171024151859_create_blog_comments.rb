class CreateBlogComments < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_comments do |t|
      t.string :commenter
      t.text :body
      t.references :blog_article, foreign_key: true

      t.timestamps
    end
  end
end
