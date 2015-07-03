require 'rails_helper'

describe 'Api for Users', type: :request do

  it 'can create a new user' do
    post '/api/users', {user: { email: 'test@email.com', 
                                password: '12345678', 
                                password_confirmation: '12345678' }}
    expect(response).to be_success
    get '/api/users'
    json = JSON.parse(response.body)
    expect(json[0]['email']).to eq('test@email.com')
  end

  context 'after a user has been created' do
    before(:each) do
      @user = create(:user)
    end

    it 'can get a list of users' do
      get '/api/users'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json[0]['email']).to eq(@user.email)
    end

    it "can view a single user" do
      get "/api/users/#{@user.id}"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['email']).to eq(@user.email)
    end

    it 'can edit a user' do
      put "/api/users/#{@user.id}", {user: { email: 'another@email.com' }}
      expect(response).to be_success
      get "/api/users/#{@user.id}"
      json = JSON.parse(response.body)
      expect(json['email']).to eq('another@email.com')
    end

    it 'can delete a user' do
      delete "/api/users/#{@user.id}"
      expect(response).to be_success
      get '/api/users'
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end

  end
end