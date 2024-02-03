class Ong < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :shelters, dependent: :destroy
  has_many :posts
  has_many :services
end
