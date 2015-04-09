#! /usr/bin/env ruby

class Salad
    attr_accessor :ingredients, :vegetarian
    def initialize (base_price)
        @base = base_price
        @ingredients = Array.new
        @vegetarian = true
        @dressing = Array.new
    end
    def add_ingredient(ingredient, meat=false)
        if meat
            @vegetarian = false
        end
        @ingredients.push(ingredient)
    end
    def add_dressing(dressing)
        @dressing.push(dressing)
    end
    def add_ingredients(ingredient_list, meat=false)
        if meat
            @vegetarian = false
        end
        ingredient_list.each {|ingredient| self.add_ingredient(ingredient)}
    end
    def price
        total = @base
        @ingredients.each { |ingredient| total += ingredient.price }
        @dressing.each_with_index { |dressing,index| index > 0 ? total += dressing.price : next }
        return total
    end
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
