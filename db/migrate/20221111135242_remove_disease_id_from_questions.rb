class RemoveDiseaseIdFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :disease_id, :bigint
  end
end
