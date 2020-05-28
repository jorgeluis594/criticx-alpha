class Company < ApplicationRecord
  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
end
