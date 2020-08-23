class UsersController < ApplicationController
    get '/account/new' do
        erb :'users/new'
    end

    get '/account/login' do
        erb :'/users/login'
    end

    post '/account/login' do
        user = User.find_by(email: params[:email])

        if (logged_in? == true)
            redirect '/error'
        elsif (params[:name] == "" || params[:email] == "" || params[:password] == "")
            redirect '/error'
        elsif (user && user.authenticate(params[:password]) == user)
            session[:user_id] = user.id
            redirect '/'
        else
            redirect '/error'
        end
    end

    get '/account/logout' do
        session.clear
        redirect '/'
    end

    get '/account/edit' do
        @user = current_user
        if (logged_in? == true && @user)
            erb :'/users/edit'
        else
            redirect '/login'
        end
    end

    post '/account' do
        user = User.find_by(email: params[:email])

        if (logged_in? == true)
            redirect '/account'
        elsif (user)
            redirect '/account/login'
        elsif (params[:name] == "" || params[:email] == "" || params[:password] == "")
            redirect '/error'
        else    
            User.create(params)
            redirect '/account/login'
        end
    end

    patch '/account' do
        @user = current_user
        if (params[:name] == "" || params[:email] == "" || params[:password] == "")
            redirect '/error'
        elsif (logged_in? == true && @user)
            @user.update(name: params[:name], email: params[:email], height: params[:height], weight: params[:weight])
            redirect '/account'
        end
    end

    delete '/account' do
        @user = current_user
        if (logged_in? == true && @user)
            @user.delete
            session.clear
            redirect '/'
        else
           redirect '/account/login' 
        end
    end

    get '/account' do
        @user = current_user
        if (logged_in? == true && @user)
            erb :'/users/show'
        else
           redirect '/account/login' 
        end
    end
end