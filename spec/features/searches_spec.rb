# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Searches', type: :feature do
  before do
  end

  scenario 'Root url' do
    visit '/'
    expect(page).to have_content('Search in Gmail')
  end

  scenario ' User creates a new search' do
    Sidekiq::Testing.inline! do
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
      expect(page.find('th#search-count').text).to have_text('2')
      expect(page).to have_text('Lorem Dupsi')
      expect(page).to have_text('Lirum Larum')
      expect(page).not_to have_text('too late mail')

      fill_in 'q_content_cont', with: 'lirum'
      click_button 'Search'

      expect(page.find('th#search-count').text).to have_text('1')
      expect(page).not_to have_text('Lorem Dupsi')
      expect(page).to have_text('Lirum Larum')
      expect(page).not_to have_text('too late mail')
    end
  end
end
