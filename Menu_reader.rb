require 'yaml'

# Read a yaml file containing a menu
def read_yml_menu(filename)

    settings = YAML::load_file filename

    meats = settings[:ingredients][:meats]
    vegetables = settings[:ingredients][:vegetables]
    dressings = settings[:ingredients][:dressings]
    leaf = settings[:ingredients][:leaves]

    ingredients = { :meats => meats, :vegetables => vegetables, :dressings => dressings, :leaf => leaf}
    sizes = settings[:sizes]
    
    return Ingredients, Sizes
end
