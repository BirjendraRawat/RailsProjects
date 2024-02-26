class CreateRemoveAgeFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :age, :integer
  end
end
