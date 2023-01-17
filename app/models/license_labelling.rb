class LicenseLabelling < ApplicationRecord
  belongs_to :license
  belongs_to :expert_detail
end
