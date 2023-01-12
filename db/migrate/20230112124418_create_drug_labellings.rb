class CreateDrugLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_labellings do |t|
      t.references :question, null: false, foreign_key: true
      t.references :drug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
