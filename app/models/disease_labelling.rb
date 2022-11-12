class DiseaseLabelling < ApplicationRecord
  belongs_to :question
  belongs_to :disease
end
