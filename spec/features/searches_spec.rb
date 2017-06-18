# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Searches', type: :feature do
  scenario 'Root url' do
    visit '/'
    expect(page).to have_content('Search in Gmail')
  end

  scenario ' User creates a new search' do
    visit(new_search_path)

    expect(page).to have_content('Search in Gmail')

    fill_in 'Email', with: 'inpay.parsetest@gmail.com'
    fill_in 'Password', with: 'rubyforthewin'
    fill_in 'From date', with: '18/06/2017'
    fill_in 'To date', with: '18/06/2017'
    click_button 'Search'

    expect(page).to have_text('Search was successfully created.')
    expect(page).to have_text('inpay.parsetest@gmail.com')
    expect(page).to have_text('from 2017-06-18')
    expect(page).to have_text('to 2017-06-18')
    expect(current_path).to eq("/searches/#{Search.last.token}")

    # Parse Job
    # expect(page).to have_content(Lorem Ipsum Etc....)
  end
end
