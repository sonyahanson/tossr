

class Ingredient
    attr_accessor :name, :price
    def initialize(name ,price)
        @name = name
        @price = price
    end
end


if __FILE__ == $0
    require './Salads.rb'
    fiftycents = [ "Apple", "Bell pepper", "Carrot", "Cellery", "Chickpeas", "Corn", "Crouton", "Cucumber", "Kidney beans", "Onion", "Pasta", "Pinto Beans", "Radish", "Tomato" ]
    seventyfivecents = [ "Alfa alfa", "Beets", "Black olives", "Broccoli", "Cauliflower", "Egg", "Eggwhite", "Grapes", "Green olives", "Mandarin", "Mushroom", "Snowpeas", "Sweet green peas" ]
    onedollar = ["Baby corn", "Blue cheese", "Cheddar", "Cherry tomato", "Eggplant", "Grape leaves", "Kalamata olives", "Parmesan cheese", "Roasted pepper", "Tofu"]
    onefifty = ["Avocado", "Artichoke hearts", "Asparagus", "Brussel sprout", "Cashewnuts", "Cranberry", "Feta cheese", "Mix vegetables", "Mozzarella", "Portabella mushroom", "Soybeans", "Sundried tomato", "Sunflower seeds"]
    twodollar = ["Almond", "Bacon", "Dry tuna", "Grilled chicken", "Ham", "Hearts of palm", "Tuna salad", "Turkey", "Walnuts" ]
    twofifty = ["Balsamic chicken", "Cajun chicken", "Chicken cutlet", "Lemon chicken", "Pesto chicken", "Sesame chicken"]
    fourdollar = ["Shrimp"]
    fourfifty = ["Salmon"]
    meat_listing = ["Balsamic chicken", "Cajun chicken", "Chicken cutlet", "Lemon chicken", "Pesto chicken", "Sesame chicken", "Shrimp", "Salmon", "Bacon", "Dry tuna", "Grilled chicken", "Ham", "Tuna salad", "Turkey"]
    prices = [0.5, 0.75, 1.0, 1.5, 2.0, 2.5, 4.0, 4.5]
    dressings_list  = ["balsamic vinaigrette", "classic ranch", "crème caesar", "chunky blue cheese", "l.f. honey dijon", "light italian", "roasted garlic red wine", "french", "russian", "feta cheese", "sesame ginger","extra virgin olive oil", "cranberry vinaigrette", "balsamic vinegar", "fresh lemon juice", "raspberry vinaigrette", "honey mustard", "italian", "red wine"]
    leaf_list = ["organic mesclun", "romaine", "baby spinach"]
    vegetables = Array.new
    meats = Array.new
    [fiftycents, seventyfivecents, onedollar, onefifty, twodollar, twofifty, fourdollar, fourfifty].each_with_index do | list, index|
        price = prices[index]
        list.each do |ingredient|
            if meat_listing.include? ingredient
                meats.push(Ingredient.new(ingredient, price))
            else
                vegetables.push(Ingredient.new(ingredient, price))
            end
        end
    end

    dressings = Array.new
    dressings_list.each do |dressing|
        dressings.push(Ingredient.new(dressing, price=0.50))
    end

    # Will need to come up with a more clever way for this later
    # Base salad settings
    size = "small"
    number_of_ingredients = 3

    if size == "small"
        base_price = 3.00
    else
        base_price = 4.00
    end

    leaves = Array.new
    leaf_list.each do |leaf|
        leaves.push(Ingredient.new(leaf, 0.0))
    end

    ingredients = { :meats => meats, :vegetables => vegetables, :dressings => dressings, :leaf => leaves}

    salad = Salad.new(base_price)
    salad.add_ingredient(ingredients[:leaf].sample)
    salad.add_dressing(ingredients[:dressings].sample)
    salad.add_ingredients(ingredients[:vegetables].sample(number_of_ingredients))
    salad.add_ingredient(ingredients[:meats].sample, meat=true)

    puts salad.inspect


end
