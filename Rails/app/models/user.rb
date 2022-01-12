class User < ApplicationRecord
    has_secure_password
    has_many :microposts , dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    validates :introduction, presence: true
    has_one_base64_attached :avatar
end