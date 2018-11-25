class CreateHomePageGossips < ActiveRecord::Migration[5.1]
  def change
    create_table :home_page_gossips do |t|
      t.text :content

      t.timestamps
    end
  end
end
