require 'spec_helper'

describe UsersController do
    before do 
        @user = User.create(name: 'test')
    end

    describe 'New' do
        it 'loads the new user page' do
            get '/users/new'
            expect(last_response.status).to eq(200)
        end

        it 'creates a new user' do
            params = {
                :name => "test",
                :email => "test",
                :password => "test"
            }
            post '/users', params
            expect(last_response.status).to eq(200)
        end

    end

    describe 'Show' do
        it 'loads the show user page' do
            get '/users/1'
            expect(last_response.status).to eq(200)
        end
    end

    describe 'Edit' do
        it 'loads the edit user page' do
            get '/users/1/edit'
            expect(last_response.status).to eq(200)
        end
    end
end