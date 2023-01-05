class CreatePharmacistDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacist_details do |t|
      t.string :office_name, null: false
      t.integer :license, null: false, default: 0
      t.string :other_license, default: "", null: false
      t.text :introduction, default: "", null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
