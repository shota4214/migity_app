class RenameQuestionIdColumnToSideEffectLabellings < ActiveRecord::Migration[6.0]
  def change
    rename_column :side_effect_labellings, :question_id, :knowledge_id
  end
end
