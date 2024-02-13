class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, presence: true, inclusion: { in: %w[ONG Voluntario Migrante] }

  has_one_attached :photo
  has_many :messages
  has_many :volunteerings
  has_many :bookings
  has_many :beds, through: :bookings
  has_many :ongs
  has_many :services, through: :volunteerings
end
