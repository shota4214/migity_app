class LicenseLabelling < ApplicationRecord
  belongs_to :license
  belongs_to :pharmacist_detail
end
