class AddDiseaseDetailRefToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :disease_detail, foreign_key: true
  end
end
