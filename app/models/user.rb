class User < ApplicationRecord
  has_many :reviews
  validates :email, :username, :birth_date, presence: true
  validates_with YearsUserValidator
end
