#! /usr/bin/env ruby

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
