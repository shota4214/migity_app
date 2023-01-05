class RemoveLicenseFromPharmacistDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacist_details, :license, :integer
  end
end
