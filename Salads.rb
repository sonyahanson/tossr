#! /usr/bin/env ruby

# A class to describe a basic ingredient
class Ingredient

    # @name is a string
    attr_accessor :name
    # @price is a float
    attr_accessor :price

    # ==== Parameters
    #
    # * +name+ - string, the name of the ingredient, e.g. bacon
    # * +price+ - float, the price of the ingredient, e.g. 1.50
    def initialize(name ,price)
        @name = name
        @price = price
    end
end


# A container type class for composing a salad
class Salad

    # @ingredients is an Array with ingredients
    attr_accessor :ingredients
    # @vegetarian is a boolean tag for whether the salad is vegetarian or not
    attr_accessor :vegetarian
    # @dressing is an Array of dressings
    attr_accessor :dressing

    # ==== Parameters
    #
    # * +base_price+ - the base price for the salad

    def initialize (base_price)
        @base = base_price
        @ingredients = Array.new
        @vegetarian = true
        @dressing = Array.new
    end

    # Add an ingredient to salad
    #
    # ==== Parameters
    #
    # * +ingredient+ - an Ingredient object
    # * +meat+ - boolean tag, is ingredient a meat
    def add_ingredient(ingredient, meat=false)
        if meat
            @vegetarian = false
        end
        @ingredients.push(ingredient)
    end

    # Add a dressing to salad
    #
    # ==== Parameters
    #
    # * +dressing+ - an Ingredient coresponding to a dressing
    def add_dressing(dressing)
        @dressing.push(dressing)
    end

    # Add an Array of Ingredients to salad
    #
    # ==== Parameters
    #
    # * +ingredients+ - an Array of Ingredient objects
    # * +meat+ - boolean tag, is ingredient a meat
    def add_ingredients(ingredient_list, meat=false)
        if meat
            @vegetarian = false
        end
        ingredient_list.each {|ingredient| self.add_ingredient(ingredient)}
    end

    # Calculate the price of the salad
    #
    # ==== Returns
    # A float containing the total price
    #
    def price
        total = @base
        @ingredients.each { |ingredient| total += ingredient.price }
        @dressing.each_with_index { |dressing,index| index > 0 ? total += dressing.price : next }
        return total
    end

    # Returns a representation of the salad
    #
    # ==== Returns
    #
    # A string representing all the ingredients of the salad and the prices
    def inspect
        # Representation of Salad object
        repres = "Salad_ID = #{self.object_id}\n"
        repres += "==============\nDressing:\n------------\n"
        @dressing.each_with_index {|dressing,index| repres += "#{dressing.name}: #{index > 0.00 ? format("%.2f", dressing.price) : "0.00"} \n"}
        repres += "\nIngredients:\n--------------\n"
        @ingredients.each {|ingredient| repres += "#{ingredient.name}: #{format("%.2f",ingredient.price)}\n"}
        repres += "\n==============\n"
        repres += "Base price: #{format("%.2f",@base)}\n"
        repres += "Total : #{format("%.2f",self.price)}"
        return repres
    end
end


class OldSalad
    attr_accessor :leaf, :toppings, :dressings
    def initialize(leaf, toppings, dressings)
        @leaf = leaf
        @toppings = toppings
        @dressings = dressings
    end
    def score
        price = 0.0
        @toppings.each { |top| price += top.price }
        if @dressings.length >= 1
            price += 0.50 * (@dressings - 1)
        end
        taste = 0.0
        @toppings.each { |top| taste += top.taste }
        @dressings.each do |dress|
            taste += dress.taste
        end

        x *price + y * taste + z

        return price
    end
end
