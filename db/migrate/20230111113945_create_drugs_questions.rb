class CreateDrugsQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :drugs_questions do |t|
      t.references :drug, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
    end
  end
end
