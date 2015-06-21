require 'rails_helper'

describe "API for Performances", type: :request do
  before do
    create(:period)
    @performance = {performance: { date: '2015-06-21' }}
  end

  it "can create a new performance" do
    post '/api/periods/1/performances', @performance
    expect(response).to be_success
    get '/api/periods/1'
    json = JSON.parse(response.body)
    expect(json['performances'].length).to eq(1)
  end

  context "after a performance has been created" do

    before do
      post '/api/periods/1/performances', @performance
    end

    it 'can get a list of performance' do
      get '/api/periods/1/performances'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json[0]['date']).to eq('2015-06-21')
    end

    it 'can view a single performance' do
      get '/api/periods/1/performances/3'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['date']).to eq('2015-06-21')
    end

    it 'can edit a performance' do
      put '/api/periods/1/performances/4', {performance: { date: '2015-07-21' }}
      expect(response).to be_success
      get '/api/periods/1/performances/4'
      json = JSON.parse(response.body)
      expect(json['date']).to eq('2015-07-21')
    end

    it 'can delete a performance' do
      delete '/api/periods/1/performances/5'
      expect(response).to be_success
      get '/api/periods/1/performances'
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end

  end
end