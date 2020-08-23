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
end