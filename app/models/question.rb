class Question < ApplicationRecord
  belongs_to :user
  # belongs_to :disease_detail
  validates :title, presence: true
  has_rich_text :content
  has_one :content, class_name: 'ActionText::RichText', as: :record
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :disease_labellings, dependent: :destroy
  has_many :diseases, through: :disease_labellings
end
