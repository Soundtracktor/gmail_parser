# frozen_string_literal: true

FactoryGirl.define do
  factory :search do
    email 'someone@example.com'
    password 'very secret'
    from_date Date.today - 1.day
    to_date Date.today
  end
end
