class Game < ApplicationRecord
  has_many :involved_companies
  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres

  has_many :expansions, class_name: "Game", foreign_key: "parent_id"
  belongs_to :parents, class_name: "Game"
end
