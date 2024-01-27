class Bed < ApplicationRecord
  belongs_to :shelter
  has_one :booking
  has_one :user, through: :booking
end
