class CreateSpecialtyLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :specialty_labellings do |t|
      t.references :disease, null: false, foreign_key: true
      t.references :pharmacist_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
