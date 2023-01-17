class DiseaseLabelling < ApplicationRecord
  belongs_to :knowledge
  belongs_to :disease
end
