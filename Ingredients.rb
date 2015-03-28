require 'money'

class Ingredient
    attr_accessor :name, :price
    def initialize(name ,price)
        @name = name
        @price = price
    end
end


if __FILE__ == $0
    puts "One day, this will contain ingredients."

end
