class RenameQuestionIdColumnToDrugLabellings < ActiveRecord::Migration[6.0]
  def change
    rename_column :drug_labellings, :question_id, :knowledge_id
  end
end
