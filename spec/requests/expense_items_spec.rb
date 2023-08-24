require 'rails_helper'

RSpec.describe 'ExpenseItems', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/expense_items/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/expense_items/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/expense_items/new'
      expect(response).to have_http_status(:success)
    end
  end
end
