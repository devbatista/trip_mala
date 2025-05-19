class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :jwt_authenticatable, 
         jwt_revocation_strategy: JwtDenylist

  validates :email,
            presence: true,
            uniqueness: {message: "is already in use. Please use another email"},
            format: {with: URI::MailTo::EMAIL_REGEXP}
end
