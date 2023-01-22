class RenameQuestionIdColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :question_id, :knowledge_id
  end
end
