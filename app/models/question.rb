class Question < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_rich_text :content
  has_one :content, class_name: 'ActionText::RichText', as: :record
  has_many :comments, dependent: :destroy
end
