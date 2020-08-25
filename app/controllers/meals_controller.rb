class MealsController < ApplicationController
    get '/meals/new' do
        if (logged_in? == false)
            redirect '/account/login'
        else
            @items = current_user.items
            erb :'meals/new'
        end
    end

    get '/meals' do
        if (logged_in? == false)
            redirect '/account/login'
        else
            @meals = current_user.meals
            @all_meal_items = MealItem.all
            erb :'/meals/index'
        end
    end

    post '/meals' do
        if (logged_in? == false)
            redirect '/account/login'
        elsif (params[:meal][:name] == "")
            redirect '/error'
        else
            meal = Meal.new
            meal.name = params[:meal][:name]
            meal.user_id = current_user.id
            meal.save
            if (params[:meal][:item_ids])
                params[:meal][:item_ids].each do |item|
                    MealItem.create(item_id: item.to_i, meal_id: meal.id)
                end
            end    
            redirect '/meals'
        end
    end

    get '/meals/:id' do
        @meal = Meal.find(params[:id])
        @meal_items = MealItem.where(meal_id: @meal.id)
        @items = @meal_items.collect do |meal_item|
            Item.find(meal_item.item_id)
        end

        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != @meal.user_id) 
            redirect '/error'   
        else
            erb :'/meals/show'
        end
    end

    get '/meals/:id/edit' do
        @meal = Meal.find(params[:id])
        @all_items = Item.all
        @all_meal_items = MealItem.where(meal_id: @meal.id)
        @meal_items = @all_meal_items.collect do |meal_item|
            Item.find(meal_item.item_id)
        end

        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != @meal.user_id) 
            redirect '/error'   
        else
            erb :'/meals/edit'
        end
    end

    patch '/meals/:id' do
        if (logged_in? == false)
            redirect '/account/login'
        elsif (params[:meal][:name] == "")
            redirect '/error'
        else
            meal = Meal.find(params[:id])
            meal.name = params[:meal][:name]
            meal.user_id = current_user.id
            meal.save

            meal_items = MealItem.where(meal_id: meal.id)

            meal_items.each do |meal_item| 
                meal_item.delete
            end

            if (params[:meal][:item_ids])
                params[:meal][:item_ids].each do |item|
                    MealItem.create(item_id: item.to_i, meal_id: meal.id)
                end
            end

            redirect '/meals'
        end
    end

    delete '/meals/:id' do
        meal = Meal.find(params[:id])
        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != meal.user_id) 
            redirect '/error'   
        else
            meal_items = MealItem.where(meal_id: meal.id)

            meal_items.each do |meal_item| 
                meal_item.delete
            end

            meal.delete

            redirect '/meals'
        end
    end
end