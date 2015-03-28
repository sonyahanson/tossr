require 'money'

class Ingredient
    attr_accessor :name, :price
    def initialize(name ,price)
        @name = name
        @price = price
    end
end


if __FILE__ == $0
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



    ingredients = { :meats => meats, :vegetables => vegetables}

    salad = Array.new
    3.times { salad.push(ingredients[:vegetables].sample) }
    salad.push(ingredients[:meats].sample)

    salad.each { |ingr| puts ingr.inspect}

end
