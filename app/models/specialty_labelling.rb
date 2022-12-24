class SpecialtyLabelling < ApplicationRecord
  belongs_to :disease
  belongs_to :pharmacist_detail
end
