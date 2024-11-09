class Move < ApplicationRecord
  belongs_to :types
  has_and_belongs_to_many :pokemons
end
