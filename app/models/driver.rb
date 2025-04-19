class Driver < ApplicationRecord

    has_one_attached :license_id
      has_one_attached :photo_id
      has_many :expenditures, as: :expenditurable
end
