class License < ApplicationRecord
  has_many :license_labellings, dependent: :destroy
  has_many :expert_details, through: :license_labellings
end
