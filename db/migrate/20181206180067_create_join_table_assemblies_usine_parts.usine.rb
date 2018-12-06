# This migration comes from usine (originally 20171103223634)
class CreateJoinTableAssembliesUsineParts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :usine_assemblies, :usine_parts do |t|
      # t.index [:assembly_id, :part_id]
      # t.index [:part_id, :assembly_id]
    end
  end
end


# the oldest

# class CreateAssembliesParts < ActiveRecord::Migration[5.1]
#   def change
#     create_table :assemblies_parts do |t|
#       t.references :assembly, foreign_key: true
#       t.references :part, foreign_key: true
#
#       t.timestamps
#     end
#   end
# end
