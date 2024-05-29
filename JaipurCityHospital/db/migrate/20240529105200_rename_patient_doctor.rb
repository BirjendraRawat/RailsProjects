class RenamePatientDoctor < ActiveRecord::Migration[6.1]
  def change
    rename_column :patients, :doctor, :doctor_id
  end
end
