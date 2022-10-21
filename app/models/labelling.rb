class Labelling < ApplicationRecord
  belongs_to :question
  belongs_to :label
end
