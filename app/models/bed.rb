class Bed < ApplicationRecord
  belongs_to :shelter

  enum status: { disponible: 0, ocupado: 1 }
end
