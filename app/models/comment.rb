class Comment < ApplicationRecord
  belongs_to :knowledge
  belongs_to :user
  validates :content, presence: true
end
