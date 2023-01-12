class Drug < ApplicationRecord
  has_many :drug_labellings, dependent: :destroy
  has_many :questions, through: :drug_labellings
end
