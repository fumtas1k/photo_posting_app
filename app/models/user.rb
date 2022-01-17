class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+\.[\w-]+\z/i }
  before_validation {email.downcase!}
  has_secure_password
  validates :password, length: {minimum: 6}
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture
end
