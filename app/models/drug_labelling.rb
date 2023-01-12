class DrugLabelling < ApplicationRecord
  belongs_to :question
  belongs_to :drug
end
