class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates_uniqueness_of :trip_id, scope: :user_id
end
