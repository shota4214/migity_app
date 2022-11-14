class AddBestAnswerToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :best_answer, :boolean, default: false, null: false
  end
end
