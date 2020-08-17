class ItemsController < ApplicationController
    get '/items/new' do
        erb :'items/new'
    end

    get '/items' do
        erb :'/items/index'
    end

    post '/items' do
        
    end

    get '/items/:id/edit' do
        erb :'/items/edit'
    end

    get '/items/:id' do
        erb :'/items/show'
    end

    post '/items/:id' do
        
    end
end