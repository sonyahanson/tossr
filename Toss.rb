    require './Ingredients.rb'
    require './Salads.rb'
    require './LeGourmet.rb'    

    include LeGourmet
    base_price = LeGourmet::Sizes[:small]
    number_of_ingredients = 3

    salad = Salad.new(base_price)
    salad.add_ingredient(LeGourmet::Ingredients[:leaf].sample)
    salad.add_dressing(LeGourmet::Ingredients[:dressings].sample)
    salad.add_ingredients(LeGourmet::Ingredients[:vegetables].sample(number_of_ingredients))
    salad.add_ingredient(LeGourmet::Ingredients[:meats].sample, meat=true)

    puts salad.inspect
