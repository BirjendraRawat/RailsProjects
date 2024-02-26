class RenameColumnInAuthors < ActiveRecord::Migration[7.1]
  def change
    rename_column :authors, :dob, :date_of_birth
  end
end
