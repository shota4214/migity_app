class AddDiseaseRefToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :disease, foreign_key: true
  end
end
