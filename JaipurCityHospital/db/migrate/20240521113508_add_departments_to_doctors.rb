class AddDepartmentsToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :departments, :string
  end
end
