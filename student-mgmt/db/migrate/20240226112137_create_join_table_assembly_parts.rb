class CreateJoinTableAssemblyParts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :assemblies, :parts do |t|
      t.index [:assembly_id, :part_id], unique: true
    end
  end
end
