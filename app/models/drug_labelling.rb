class DrugLabelling < ApplicationRecord
  belongs_to :knowledge
  belongs_to :drug
end
