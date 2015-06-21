require 'rails_helper'

describe 'API for Periods', type: :request do

  it 'can create a new period' do
    post '/api/periods', {period: { production: 'La Boheme' }}
    expect(response).to be_success
    get '/api/periods'
    json = JSON.parse(response.body)
    expect(json[0]['production']).to eq('La Boheme')
  end

  it 'can create a new period with performances' do
    post '/api/periods', {period: { production: 'La Boheme', performances_attributes: [{date: '2015-06-21'}] }}
    expect(response).to be_success
    get '/api/periods'
    json = JSON.parse(response.body)
    expect(json[0]['performances'].length).to eq(1)
  end
  
  context 'after a period has been created' do

    before do
      @period = create(:period)
    end

    it 'can get a list of periods' do
      get '/api/periods'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json[0]['production']).to eq(@period.production)
    end

    it 'can view a single period' do
      get '/api/periods/1'
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['production']).to eq(@period.production)
    end

    it 'can edit a period' do
      put '/api/periods/1', {period: { production: 'La Traviata' }}
      expect(response).to be_success
      get '/api/periods'
      json = JSON.parse(response.body)
      expect(json[0]['production']).to eq('La Traviata')
    end

    it 'can delete a period' do
      delete '/api/periods/1'
      expect(response).to be_success
      get '/api/periods'
      json = JSON.parse(response.body)
      expect(json.length).to eq(0)
    end

  end
end
