class Disease < ApplicationRecord
  has_many :disease_details, dependent: :destroy
  has_many :disease_labellings, dependent: :destroy
  has_many :questions, through: :disease_labellings
end
