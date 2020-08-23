class ItemsController < ApplicationController

    get '/items/new' do
        if (logged_in? == false)
            redirect '/account/login'
        else
            erb :'items/new'
        end
    end

    get '/items' do   
        if (logged_in? == false)
            redirect '/account/login'
        else
            @items = current_user.items
            erb :'/items/index'
        end
    end

    post '/items' do
        if (logged_in? == false)
            redirect '/account/login'
        elsif (params[:name] == "")
            redirect '/error'
        else
            item = Item.new(params)
            item.user_id = current_user.id
            item.save
            redirect '/items'
        end
    end

    get '/items/:id' do
        @item = Item.find(params[:id])

        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != @item.user_id) 
            redirect '/error'   
        else
            erb :'/items/show'
        end
    end

    get '/items/:id/edit' do
        @item = Item.find(params[:id])

        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != @item.user_id) 
            redirect '/error'    
        else
            erb :'/items/edit'
        end
    end

    patch '/items/:id' do
        item = Item.find(params[:id])
        if (logged_in? == false)
            redirect '/account/login'
        elsif (current_user.id != item.user_id) 
            redirect '/error'    
        elsif(params[:name] == "")
            redirect '/error'
        else
            item.update(name: params[:name], calories: params[:calories], total_fat: params[:total_fat], cholesterol: params[:cholesterol], sodium: params[:sodium], total_carbs: params[:total_carbs], protein: params[:protein], user_id: current_user.id)
            redirect "/items/#{item.id}"
        end
    end

    delete '/items/:id' do
        # Have to update to delete from all associated meals as well
        item = Item.find(params[:id])
        if (logged_in? == false)    
            redirect '/account/login'
        elsif (current_user.id != item.user_id) 
            redirect '/error'    
        else
            item.delete
            redirect '/items'
        end
    end
end