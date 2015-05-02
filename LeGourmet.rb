# A menu generator for LeGourmet
require "./Salads.rb"
require 'yaml'

module LeGourmet
    include Salads

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
    vegetables = Hash.new
    meats = Hash.new
    [fiftycents, seventyfivecents, onedollar, onefifty, twodollar, twofifty, fourdollar, fourfifty].each_with_index do | list, index|
        price = prices[index]
        list.each do |ingredient|
            if meat_listing.include? ingredient
                meats[ingredient] = { 'price' => price}
            else
                vegetables[ingredient] = { 'price' => price}
            end
        end
    end

    dressings = Hash.new
    dressings_list.each do |dressing|
        dressings[dressing] = { 'price'=> 0.50 }
    end

    leaves = Hash.new
    leaf_list.each do |leaf|
        leaves[leaf] = { 'price' => 0.00 }
    end

    # The price for each available size
    Sizes = { :small => 3.00, :large => 4.00 }

    # Hash containing all the available 'Ingredient's from  the Le Gourmet menu.
    Ingredients = { :meats => meats, :vegetables => vegetables, :dressings => dressings, :leaf => leaves}

    yaml_content = {:ingredients => Ingredients, :sizes => Sizes}
    File.open("legourmet.yml", "w") do |file|
       file.write yaml_content.to_yaml
    end

end
