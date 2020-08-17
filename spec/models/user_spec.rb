require 'spec_helper'
require 'pry'

describe 'User' do
    before do
        @user = User.create(name: 'test', height: 72, weight: 130, email: 'test@test.com', password: 'test')
    end

    it 'has a secure password' do
        expect(@user.authenticate("password")).to eq(false)
        expect(@user.authenticate("test")).to eq(@user)
    end
end