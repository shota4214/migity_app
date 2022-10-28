class CreateLabelDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :label_details do |t|
      t.string :content, null: false
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
