class Item < ActiveRecord::Base
    belongs_to :user
    has_many :meal_items
    has_many :meals, through: :meal_items
end