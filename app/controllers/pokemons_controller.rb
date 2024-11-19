class PokemonsController < ApplicationController
  def index
    if params[:query].present?
      @pokemons = Pokemon.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    else
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
