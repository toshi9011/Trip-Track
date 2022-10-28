class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :validatable, password_length: 8..128
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :trips, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, presence: true

  def already_favorited?(trip)
    self.favorites.exists?(trip_id: trip.id)
  end
end
