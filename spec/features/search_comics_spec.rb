require 'rails_helper'

RSpec.feature 'Search Comics', type: :feature do
  it 'filters comics', js: true do
    VCR.use_cassette('comics_list', match_requests_on: [:path]) do
      visit '/'
      fill_in 'search', with: 'Deadpool'
    end

    VCR.use_cassette('comics_search', match_requests_on: [:path]) do
      click_on 'search-submit'
      expect(page).to have_css('.comic-title', text: 'Deadpool (2008) #55', count: 1)
    end
  end
end

