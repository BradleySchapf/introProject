class Move < ApplicationRecord
  belongs_to :types
  has_and_belongs_to_many :pokemons

  # validations
  validates :name, presence: true, uniqueness: true
  validates :accuracy, :power, presence: true
end
