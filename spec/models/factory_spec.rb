# -*- encoding : utf-8 -*-
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'validate FactoryGirl factories', type: :model do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe "factory #{factory_name}" do
      it 'is valid' do
        2.times do
          factory = FactoryGirl.build(factory_name)
          if factory.respond_to?(:valid?)
            expect(factory).to be_valid, -> { factory.errors.full_messages.join(',') }
          end

          factory.save

          expect(factory.persisted?).to eq true
        end
      end
    end

    describe 'with trait' do
      FactoryGirl.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
        it "is valid with trait #{factory_name} #{trait_name}" do
          2.times do
            factory = FactoryGirl.build(factory_name, trait_name)
            if factory.respond_to?(:valid?)
              expect(factory).to be_valid, -> { factory.errors.full_messages.join(',') }
            end
            factory.save
            expect(factory.persisted?).to eq true
          end
        end
      end
    end
  end
end
