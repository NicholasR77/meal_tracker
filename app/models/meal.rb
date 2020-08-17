class Meal < ActiveRecord::Base
    belongs_to :user
    has_many :meal_items
    has_many :items, through: :meal_items
end