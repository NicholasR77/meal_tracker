class UsersController < ApplicationController
    get '/users/new' do
        erb :'users/new'
    end

    post '/users' do
        # Need to add check here for if logged in
        if (params[:name] == "" || params[:email] == "" || params[:password] == "")
            redirect '/error'
        else
            User.create(params)
            redirect '/login'
        end
    end

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/login' do
        user = User.find_by(email: params[:email])
        if (logged_in? == true)
            redirect '/'
        elsif (params[:name] == "" || params[:email] == "" || params[:password] == "")
            redirect '/error'
        elsif (user && user.authenticate(params[:password]) == user )
            session[:user_id] == user.id
            redirect '/'
        else
            redirect '/error'
        end
    end

    get '/users/logout' do
        session.clear
        redirect '/'
    end

    get '/users/:id/edit' do
        erb :'/users/edit'
    end

    get '/users/:id' do
        erb :'/users/show'
    end

    post '/users/:id' do
        
    end
end