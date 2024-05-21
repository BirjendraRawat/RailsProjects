class RenameDoctorsDepartmnets < ActiveRecord::Migration[6.1]
  def change
    rename_column :doctors, :departments, :department
  end
end
