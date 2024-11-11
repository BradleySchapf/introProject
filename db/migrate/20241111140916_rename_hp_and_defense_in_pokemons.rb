class RenameHpAndDefenseInPokemons < ActiveRecord::Migration[8.0]
  def change
    rename_column :pokemons, :HP, :hp
    rename_column :pokemons, :defense, :defence
  end
end
