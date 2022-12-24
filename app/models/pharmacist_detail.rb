class PharmacistDetail < ApplicationRecord
  belongs_to :user
  has_many :specialty_labellings, dependent: :destroy
  has_many :diseases, through: :specialty_labellings

  enum license: {
    "---": 0,
    医療薬学専門薬剤師: 1, がん専門薬剤師: 2, がん指導薬剤師: 3, 外来がん治療専門薬剤師: 4, 外来がん認定薬剤師: 5
  }
end
