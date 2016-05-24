require 'rails_helper'

RSpec.feature 'List Comics', type: :feature do
  it 'lists all the comics' do
    VCR.use_cassette('comics_list', match_requests_on: [:path]) do
      visit '/'
      expect(page).to have_css('div.comic-box', count: 20)
    end
  end
end
