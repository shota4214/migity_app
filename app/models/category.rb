class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :note_categories, dependent: :destroy
  has_many :notes, through: :note_categories
end
