require 'spec_helper'

describe ItemsController do
    before do 
        @item = Item.create(name: 'test')
    end

    describe 'Index' do
        it 'loads the item index page' do
           get '/items'
           expect(last_response.status).to eq(200)
        end
    end

    describe 'New' do
        it 'loads the new item page' do
            get '/items/new'
            expect(last_response.status).to eq(200)
        end
    end

    describe 'Show' do
        it 'loads the show item page' do
            get '/items/1'
            expect(last_response.status).to eq(200)
        end
    end

    describe 'Edit' do
        it 'loads the edit item page' do
            get '/items/1/edit'
            expect(last_response.status).to eq(200)
        end
    end
end