require "json"

# Destroy any existing data


Move.destroy_all
Type.destroy_all
Pokemon.destroy_all

# File paths
pokemon_file_path = File.expand_path("../pokemon/pokedex.json", __dir__)
type_file_path = File.expand_path("../pokemon/types.json", __dir__)
move_file_path = File.expand_path("../pokemon/moves.json", __dir__)

# Read and parse JSON files
pokemon_file = File.read(pokemon_file_path)
type_file = File.read(type_file_path)
move_file = File.read(move_file_path)

pokemon_data = JSON.parse(pokemon_file)
type_data = JSON.parse(type_file)
move_data = JSON.parse(move_file)

# Create Types
type_data.each do |type|
  Type.create!(name: type["english"])
end

# Create Moves
move_data.each do |move|
  move_type = Type.find_by(name: move["type"])
  Move.create!(
    name: move["ename"],
    accuracy: move["accuracy"] || 0,
    power: move["power"] || 0,
    pp: move["pp"] || 0,
    type: move_type
  )
end

# Create Pokemon
pokemon_data.each do |pokemon|
  # Find or create associated types
  types = pokemon["type"].map do |type_name|
    Type.find_by(name: type_name)
  end.compact

  # Create Pokemon with associated types and moves
  created_pokemon = Pokemon.create!(
    name: pokemon["name"]["english"],
    HP: pokemon["base"]["HP"],
    attack: pokemon["base"]["Attack"],
    defense: pokemon["base"]["Defense"],
    sp_attack: pokemon["base"]["Sp. Attack"],
    sp_defence: pokemon["base"]["Sp. Defense"],
    speed: pokemon["base"]["Speed"]
  )

  # Associate types with the created Pokemon
  created_pokemon.types << types
end

puts "Seeding completed successfully!"
