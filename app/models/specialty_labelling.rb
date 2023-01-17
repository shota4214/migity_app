class SpecialtyLabelling < ApplicationRecord
  belongs_to :disease
  belongs_to :expert_detail
end
