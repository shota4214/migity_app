class Drug < ApplicationRecord
  has_many :drug_labellings, dependent: :destroy
  has_many :knowledges, through: :drug_labellings
end
