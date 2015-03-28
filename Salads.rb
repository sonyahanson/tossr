#! /usr/bin/env ruby

class Salad
    attr_accessor :ingredients, :vegetarian
    def initialize
        @ingredients = Array.new
        @vegetarian = true
    end
    def add_ingredient(ingredient, meat=false)
        if meat
            @vegetarian = false
        end
        @ingredients.push(ingredient)
    end
    def add_ingredients(ingredient_list, meat=false)
        if meat
            @vegetarian = false
        end
        ingredient_list.each {|ingredient| self.add_ingredient(ingredient) }
    end

    def price
        total = 0.00
        @ingredients.each { |ingredient| total += ingredient.price }
        return "%.2f" % total
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
