# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #new' do
    subject do
      get :new
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    subject do
      get(
        :create,
        params: {
          search: {
            email: 'someone@example.com',
            password: 'very-much-a-s3cr3t',
            from_date: '2016-11-23',
            to_date: '2016-11-25'
          }
        }
      )
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'creates a search' do
      expect do
        subject
      end.to change(Search, :count).by(1)

      search = Search.last
      expect(search.email).to eq('someone@example.com')
      expect(search.password).to eq('very-much-a-s3cr3t')
      expect(search.from_date).to eq(Date.parse('2016-11-23'))
      expect(search.to_date).to eq(Date.parse('2016-11-25'))
    end

    it 'redirects correctly' do
      subject
      search = Search.last
      expect(response).to redirect_to(search_path(id: search.token))
    end
  end

  describe 'GET #show' do
    let(:search) do
      create(:search)
    end

    subject do
      get :show, params: { id: search.token }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
