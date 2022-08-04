class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address"}
    validates_presence_of :name
    validates_presence_of :password
    validates_presence_of :password_confirmation
end
