require 'spec_helper'

describe MealsController do
    before do 
        @meal = Meal.create(name: 'test')
    end

    describe 'Index' do
        it 'loads the meals index page' do
           get '/meals'
           expect(last_response.status).to eq(200)
        end
    end

    describe 'New' do
        it 'loads the new meal page' do
            get '/meals/new'
            expect(last_response.status).to eq(200)
        end
    end

    describe 'Show' do
        it 'loads the show meal page' do
            get '/meals/1'
            expect(last_response.status).to eq(200)
        end
    end

    describe 'Edit' do
        it 'loads the edit meal page' do
            get '/meals/1/edit'
            expect(last_response.status).to eq(200)
        end
    end
end