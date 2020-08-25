class Item < ActiveRecord::Base
    belongs_to :user
    has_many :items_meals
    has_many :meals, through: :items_meals
end