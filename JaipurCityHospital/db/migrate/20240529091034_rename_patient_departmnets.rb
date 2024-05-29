class RenamePatientDepartmnets < ActiveRecord::Migration[6.1]
  def change
    rename_column :patients, :departments, :department
  end
end
