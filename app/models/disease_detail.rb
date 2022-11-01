class DiseaseDetail < ApplicationRecord
  belongs_to :disease
  has_many :questions, dependent: :destroy
end
