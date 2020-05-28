class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  validates :email, :username, :birth_date, presence: true
  validates_with YearsUserValidator
end
