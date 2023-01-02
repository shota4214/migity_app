class CreateLicenseLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :license_labellings do |t|
      t.references :license, null: false, foreign_key: true
      t.references :pharmacist_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
