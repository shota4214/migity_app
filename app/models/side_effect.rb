class SideEffect < ApplicationRecord
  has_many :side_effect_labellings, dependent: :destroy
  has_many :knowledges, through: :side_effect_labellings
end
