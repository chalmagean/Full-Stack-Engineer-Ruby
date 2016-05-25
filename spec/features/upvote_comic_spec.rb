require 'rails_helper'

RSpec.feature 'Upvote Comic', type: :feature do
  it 'upvotes a comic', js: true do
    VCR.use_cassette('comics_list', match_requests_on: [:path]) do
      visit '/'
      find('.upvote-btn', match: :first).click
      expect(page).to have_css('.fa-star', count: 1)
    end
  end
end


