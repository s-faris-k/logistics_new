class Vehicle < ApplicationRecord

    has_one_attached :image
    has_one_attached :doc

end
