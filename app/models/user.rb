class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :jwt_authenticatable, 
         jwt_revocation_strategy: JwtDenylist

  has_many :trip_checklists, dependent: :destroy
  has_many :trips, dependent: :destroy

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :password, presence: true, length: {minimum: 6}, on: :create
end
