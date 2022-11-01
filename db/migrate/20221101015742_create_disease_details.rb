class CreateDiseaseDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :disease_details do |t|
      t.string :content, null: false
      t.references :disease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
