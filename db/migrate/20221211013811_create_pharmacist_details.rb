class CreatePharmacistDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacist_details do |t|
      t.string :office_name, null: false
      t.string :license, null: false
      t.string :specialty, null: false
      t.text :introduction, null: false
      t.string :other_license
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
