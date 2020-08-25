class MealItem < ActiveRecord::Base
    belongs_to :meals
    belongs_to :items
end