require 'rails_helper'

RSpec.describe ComicsHelper, type: :helper do
  let(:thumb) { double('Thumbnail', path: 'image_path', extension: 'jpg') }
  let(:comic) { double('Comic', id: 1, title: 'Awesome', thumbnail: thumb) }

  it 'wraps the comic in some html' do
    output = helper.comic_box(comic, [])
    expect(output).to have_css('.comic-box', count: 1)
    expect(output).to have_css('.comic-actions', count: 1)
    expect(output).to have_css('.upvote-btn', count: 1)
    expect(output).to have_css('span', text: 'Awesome', count: 1)
  end

  context 'when the comic was already upvoted' do
    it 'replaces the button with a star' do
      output = helper.comic_box(comic, [comic.id])
      expect(output).to have_css('.fa-star', count: 1)
      expect(output).to_not have_css('.upvote-btn', count: 1)
    end
  end
end
