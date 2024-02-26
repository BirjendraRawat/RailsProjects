class RemoveAgeFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :age, :integer
    remove_column :authors, :dob, :integer
  end
end
