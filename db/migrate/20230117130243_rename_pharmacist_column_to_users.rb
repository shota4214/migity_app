class RenamePharmacistColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :pharmacist, :expert
  end
end
