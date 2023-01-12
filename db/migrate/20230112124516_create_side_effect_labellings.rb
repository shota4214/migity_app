class CreateSideEffectLabellings < ActiveRecord::Migration[6.0]
  def change
    create_table :side_effect_labellings do |t|
      t.references :question, null: false, foreign_key: true
      t.references :side_effect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
