class Shelter < ApplicationRecord
  belongs_to :ong
  has_many :beds
end
