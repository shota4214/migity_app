class PharmacistDetail < ApplicationRecord
  belongs_to :user
  has_many :specialty_labellings, dependent: :destroy
  has_many :diseases, through: :specialty_labellings
  has_many :license_labellings, dependent: :destroy
  has_many :licenses, through: :license_labellings
  
end
