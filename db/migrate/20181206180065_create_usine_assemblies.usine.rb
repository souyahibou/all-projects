# This migration comes from usine (originally 20171103015143)
class CreateUsineAssemblies < ActiveRecord::Migration[5.1]
  def change
    create_table :usine_assemblies do |t|
      t.string :name

      t.timestamps
    end
  end
end
