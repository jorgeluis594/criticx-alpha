class Platform < ApplicationRecord
  has_and_belongs_to_many :games
  enum category: [:console,:arcade,:platform,:operating_system,:portable_console,:computer]
  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
