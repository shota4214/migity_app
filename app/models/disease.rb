class Disease < ApplicationRecord
  has_many :disease_labellings, dependent: :destroy
  has_many :knowledges, through: :disease_labellings
  has_many :specialty_labellings, dependent: :destroy
  has_many :expert_details, through: :specialty_labellings
end
