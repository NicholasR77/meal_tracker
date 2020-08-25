class Meal < ActiveRecord::Base
    belongs_to :user
    has_many :meal_items
    has_many :items, through: :meal_items

    def self.calc_totals(items)
        totals = {
            :total_calories => 0,
            :total_fat => 0,
            :total_cholesterol => 0,
            :total_sodium => 0,
            :total_carbs => 0,
            :total_protein => 0
        }
        items.each do |item|
            item.calories == nil ? totals[:total_calories] = 0 : totals[:total_calories] += item.calories
            item.total_fat == nil ? totals[:total_fat] = 0 : totals[:total_fat] += item.total_fat
            item.cholesterol == nil ? totals[:total_cholesterol] = 0 : totals[:total_cholesterol] += item.cholesterol
            item.sodium == nil ? totals[:total_sodium] = 0 : totals[:sodium] += item.sodium
            item.total_carbs == nil ? totals[:total_carbs] = 0 : totals[:total_carbs] += item.total_carbs
            item.protein == nil ? totals[:total_protein] = 0 : totals[:total_protein] += item.protein
        end
        totals
    end
end