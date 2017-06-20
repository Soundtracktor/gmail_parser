# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'responds_to' do
    %i[
      search content
    ].each do |key|
      it { is_expected.to respond_to(key) }
    end
  end

  context 'relationships' do
    %i[
      search
    ].each do |key|
      it { is_expected.to belong_to(key) }
    end
  end

  context 'validations' do
    %i[
      search
    ].each do |key|
      it { is_expected.to validate_presence_of(key) }
    end
  end
end
