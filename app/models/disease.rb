class Disease < ApplicationRecord
  has_many :disease_details, dependent: :destroy
  has_many :questions, dependent: :destroy
end
