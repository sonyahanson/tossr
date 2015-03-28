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

    puts "One day, this will contain ingredients."

end
