class CreateNoteCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :note_categories do |t|
      t.references :note, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
