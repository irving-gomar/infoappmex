class Ong < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :services
  has_many :shelters
end
