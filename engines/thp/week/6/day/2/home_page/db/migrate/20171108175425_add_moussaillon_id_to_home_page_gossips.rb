class AddMoussaillonIdToHomePageGossips < ActiveRecord::Migration[5.1]
  def change
    add_column :home_page_gossips, :moussaillon_id, :integer
  end
end
