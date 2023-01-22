class RenamePharmacistDetailIdColumnToLicenseLabellings < ActiveRecord::Migration[6.0]
  def change
    rename_column :license_labellings, :pharmacist_detail_id, :expert_detail_id
  end
end
