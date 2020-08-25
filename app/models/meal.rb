class Meal < ActiveRecord::Base
    belongs_to :user
    has_many :meal_items
    has_many :items, through: :meal_items

    def self.calc_totals(items)
        totals = {
            :total_calories => 0,
            :total_fat => 0,
            :cholesterol => 0,
            :sodium => 0,
            :total_carbs => 0,
            :total_protein => 0
        }
        items.each do |item|
            totals[:total_calories] += item.calories
            totals[:total_fat] += item.total_fat
            totals[:cholesterol] += item.cholesterol
            totals[:sodium] += item.sodium
            totals[:total_carbs] += item.total_carbs
            totals[:total_protein] += item.protein
        end
        totals
    end
end