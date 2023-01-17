class ChangePharmacistDetailsToExpertDetails < ActiveRecord::Migration[6.0]
  def change
    rename_table :pharmacist_details, :expert_details
  end
end
