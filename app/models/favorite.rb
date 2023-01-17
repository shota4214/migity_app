class Favorite < ApplicationRecord
  belongs_to :knowledge
  belongs_to :user
  validates_uniqueness_of :knowledge_id, scope: :user_id
end
