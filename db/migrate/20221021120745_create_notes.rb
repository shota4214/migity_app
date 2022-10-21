class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :draft, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
