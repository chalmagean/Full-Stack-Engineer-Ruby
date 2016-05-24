require 'rails_helper'

RSpec.describe ComicsHelper, type: :helper do
  it 'wraps the comic in some html' do
    thumb = double('Thumbnail', path: 'image_path', extension: 'jpg')
    comic = double('Comic', title: 'Awesome', thumbnail: thumb)
    output = helper.comic_box(comic)
    expect(output).to have_css('.comic-box', count: 1)
    expect(output).to have_css('span', text: 'Awesome', count: 1)
  end
end
