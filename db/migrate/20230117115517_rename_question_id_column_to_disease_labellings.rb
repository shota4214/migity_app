class RenameQuestionIdColumnToDiseaseLabellings < ActiveRecord::Migration[6.0]
  def change
    rename_column :disease_labellings, :question_id, :knowledge_id
  end
end
