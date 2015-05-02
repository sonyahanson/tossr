require './Salads.rb'
require './Menu_reader.rb'
include Salads

# The menu is read from a .yml file
ingredients, sizes = read_yml_menu("legourmet.yml")

base_price = sizes[:small]
number_of_ingredients = 3

salad = Salads::Salad.new(base_price)
salad.add_ingredient(ingredients[:leaf].sample)
salad.add_dressing(ingredients[:dressings].sample)
salad.add_ingredients(ingredients[:vegetables].sample(number_of_ingredients))
salad.add_ingredient(ingredients[:meats].sample, meat=true)

puts salad.inspect
