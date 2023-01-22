class ChangeQuestionsToKnowledges < ActiveRecord::Migration[6.0]
  def change
    rename_table :questions, :knowledges
  end
end
