class Ong < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :posts
  has_many :services
  has_many :shelters
end
