class Knowledge < ApplicationRecord
  validates :title, presence: true
  validates :disease_ids, presence: { message: "ラベルは１つ必ず選んでください"}, if: :selected_label?
  belongs_to :user
  has_rich_text :content
  is_impressionable counter_cache: true
  has_one :content, class_name: 'ActionText::RichText', as: :record
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :disease_labellings, dependent: :destroy
  has_many :diseases, through: :disease_labellings
  has_many :drug_labellings, dependent: :destroy
  has_many :drugs, through: :drug_labellings
  has_many :side_effect_labellings, dependent: :destroy
  has_many :side_effects, through: :side_effect_labellings

  def selected_label?
    drug_ids.empty? && side_effect_ids.empty?
  end

end
