# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search, type: :model do
  context 'responds_to' do
    %i[
      from_date to_date email encrypted_password password password= token
    ].each do |key|
      it { is_expected.to respond_to(key) }
    end
  end

  context 'relationships' do
    %i[
    ].each do |key|
      it { is_expected.to belong_to(key) }
    end

    %i[
    ].each do |key|
      it { is_expected.to have_many(key).dependent(:destroy) }
    end
  end

  context 'validations' do
    %i[
      from_date to_date email encrypted_password
    ].each do |key|
      it { is_expected.to validate_presence_of(key) }
    end
  end

  context 'methods' do
    it 'should generate token' do
      search = create(:search)
      expect(search.token).to be_present
    end

    context 'password' do
      it 'should have access to salt' do
        expect(ENV['SALT']).to be_present
      end

      it 'should set encrypted password' do
        search = create(:search, password: 'somepassword')
        expect(search.encrypted_password).not_to eq('somepassword')
      end

      it 'should decrypt encrypted password' do
        search = create(:search, password: 'somepassword')
        expect(search.encrypted_password).not_to eq('somepassword')
        expect(search.password).to eq('somepassword')
      end
    end
  end
end
