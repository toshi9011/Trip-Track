class Trip < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end

end
