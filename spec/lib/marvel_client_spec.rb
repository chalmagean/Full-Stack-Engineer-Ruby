require 'rails_helper'

RSpec.describe MarvelClient do
  let(:mc) do
    double('MarvelClient', comics: [], characters: []).as_null_object
  end

  before :each do
    allow(Marvel::Client).to receive(:new).and_return(mc)
  end

  it 'finds comics by character name' do
    expect(mc).to receive(:characters).with(name: 'Deadpool')
    MarvelClient.comics(query: 'Deadpool')
  end

  it 'finds all comics if no name was specified' do
    expect(mc).to receive(:comics)
    MarvelClient.comics({})
  end

  describe 'pagination' do
    it 'passes in the current page' do
      # 20 per page * current page number (2) => 40
      expect(mc).to receive(:comics).
        with(offset: 40, orderBy: 'modified')
      MarvelClient.comics(page: "2")
    end
  end
end
