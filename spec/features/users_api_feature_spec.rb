require 'rails_helper'

describe 'Api for Users', type: :request do

  describe "GET #show" do
    before(:each) do
      @user = create(:user)
    end

    it "returns the information about a reporter on a hash" do
      get "/api/users/#{@user.id}"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['email']).to eq(@user.email)
    end

  end
end