require 'yaml'
require './Salads.rb'

include Salads

# Read a yaml file containing a menu
def read_yml_menu(filename)

    settings = YAML::load_file filename

    meats = settings[:ingredients][:meats]
    vegetables = settings[:ingredients][:vegetables]
    dressings = settings[:ingredients][:dressings]
    leaf = settings[:ingredients][:leaf]

    ingredients = { :meats => hash_to_ingredient(meats), :vegetables => hash_to_ingredient(vegetables), :dressings => hash_to_ingredient(dressings), :leaf => hash_to_ingredient(leaf)}
    sizes = settings[:sizes]
    return ingredients, sizes
end

# Convert a hash of ingredients with metadata to a list of Ingredient objects
def hash_to_ingredient(dict)
    ingredients = Array.new

    # Each ingredient has name as key, and metadata as a dictionary.
    # At this point, we just extract the price, but we can expand this later
    puts dict.inspect
    dict.each do |name,ingr|
        ingredients.push(Salads::Ingredient.new(name, ingr["price"]))
    end
    return ingredients
end
