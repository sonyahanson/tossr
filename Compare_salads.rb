require './Salads.rb'
require './Menu_reader.rb'
include Salads

# The menu is read from a .yml file
ingredients, sizes = read_yml_menu("legourmet.yml")

# The set salads are read from the .yml file
set_salads = read_yml_setsalads("legourmet.yml")

puts set_salads
puts ingredients[:meats][0]

# Find the 'normal' price of set salads
base_price = sizes[:small]

salad = Salads::Salad.new(base_price)
#salad.add_ingredient(ingredients[:leaf].sample)
#salad.add_dressing(ingredients[:dressings].sample)
#salad.add_ingredients(ingredients[:vegetables].sample(number_of_ingredients))
salad.add_ingredient(ingredients[:meats][0], meat=true)

puts salad.inspect
