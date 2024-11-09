class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :HP
      t.integer :attack
      t.integer :defense
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed

      t.timestamps
    end
  end
end
