class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      # t.text :content
      t.boolean :resolved, null: false, default: false
      t.boolean :draft, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
