class MealsController < ApplicationController
    get '/meals/new' do
        erb :'meals/new'
    end

    get '/meals' do
        erb :'/meals/index'
    end

    post '/meals' do
        
    end

    get '/meals/:id/edit' do
        erb :'/meals/edit'
    end

    get '/meals/:id' do
        erb :'/meals/show'
    end

    post '/meals/:id' do
        
    end
end