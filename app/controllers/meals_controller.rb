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
            params[:meal][:item_ids].each do |item|
                MealItem.create(item_id: item.to_i, meal_id: meal.id)
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
        erb :'/meals/edit'
    end

    patch '/meals/:id' do
        
    end

    delete '/meals/:id' do
        
    end
end