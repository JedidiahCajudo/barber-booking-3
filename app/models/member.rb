class Member < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :appointments, dependent: :destroy # This ensures that appointments are destroyed when the member is destroyed
end
