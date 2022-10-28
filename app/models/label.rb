class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :questions, through: :labellings, source: :question
  has_many :label_details, dependent: :destroy
end
