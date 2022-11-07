class Note < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_rich_text :content
  has_one :content, class_name: 'ActionText::RichText', as: :record
end
