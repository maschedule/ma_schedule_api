require 'spec_helper'

describe 'API for Sessions', type: :request do

  before(:each) do
    @user = FactoryGirl.create :user
  end

  describe "POST #create" do
    context "when the credentials are correct" do
      before(:each) do
        credentials = { email: @user.email, password: "12345678" }
        post "/api/sessions", { session: credentials }
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(response).to be_success
        json = JSON.parse(response.body)
        expect(json['auth_token']).to eq(@user.auth_token)
      end
    end

    context "when the credentials are incorrect" do
      before(:each) do
        credentials = { email: @user.email, password: "invalidpassword" }
        post "/api/sessions", { session: credentials }
      end

      it "returns a json with an error" do
        expect(response).not_to be_success
        json = JSON.parse(response.body)
        expect(json['errors']).to eq "Invalid email or password"
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      p @user.auth_token
      credentials = { email: @user.email, password: "12345678" }
      post "/api/sessions", { session: credentials }
      @user.reload
      delete "/api/sessions/#{@user.auth_token}"
    end

    it 'destroy a session' do
      expect(response.status).to eq 204
    end

  end
end