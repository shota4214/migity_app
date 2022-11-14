class AddPrefecturesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :prefectures, :integer, null: false, default: 0
  end
end
