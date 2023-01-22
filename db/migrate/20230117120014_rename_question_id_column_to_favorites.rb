class RenameQuestionIdColumnToFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_column :favorites, :question_id, :knowledge_id
  end
end
