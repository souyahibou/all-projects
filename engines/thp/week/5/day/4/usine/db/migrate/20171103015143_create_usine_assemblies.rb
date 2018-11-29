class CreateUsineAssemblies < ActiveRecord::Migration[5.1]
  def change
    create_table :usine_assemblies do |t|
      t.string :name

      t.timestamps
    end
  end
end
