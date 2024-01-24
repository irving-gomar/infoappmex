class Service < ApplicationRecord
  belongs_to :ong
  has_many :volunteerings
  has_many :users, through: :volunteerings
end
