class CreateQuestionsSideEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :questions_side_effects do |t|
      t.references :question, null: false, foreign_key: true
      t.references :side_effect, null: false, foreign_key: true
    end
  end
end
