class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 8 }, confirmation: true

    has_many :dairies, dependent: :destroy
    has_many :favorites, dependent: :destroy
end
