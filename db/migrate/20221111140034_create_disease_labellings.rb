class CreateDiseaseLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :disease_labellings do |t|
      t.references :question, null: false, foreign_key: true
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
