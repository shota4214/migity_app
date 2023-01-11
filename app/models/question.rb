class Question < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_rich_text :content
  is_impressionable counter_cache: true
  has_one :content, class_name: 'ActionText::RichText', as: :record
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :disease_labellings, dependent: :destroy
  has_many :diseases, through: :disease_labellings
  has_and_belongs_to_many :drugs
  has_and_belongs_to_many :side_effects
end
