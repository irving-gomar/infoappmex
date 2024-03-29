class Bed < ApplicationRecord
  belongs_to :shelter
  enum status: { disponible: 0, ocupada: 1 }
  has_one :booking, dependent: :destroy
  has_one :user, through: :booking
end
