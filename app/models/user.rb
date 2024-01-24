class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

enum role: {
  0 => "ONG",
  1 => "Voluntario",
  2 => "Migrante"
}

  has_many :messages
  has_many :volunteerings
  has_many :bookings
  has_many :beds, through: :bookings
  has_many :ongs
  has_many :services, through: :volunteerings
end
