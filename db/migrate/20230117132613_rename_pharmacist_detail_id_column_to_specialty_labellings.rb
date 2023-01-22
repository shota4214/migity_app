class RenamePharmacistDetailIdColumnToSpecialtyLabellings < ActiveRecord::Migration[6.0]
  def change
    rename_column :specialty_labellings, :pharmacist_detail_id, :expert_detail_id
  end
end
