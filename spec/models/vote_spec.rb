require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should validate_presence_of(:comic_id) }
  it { should validate_uniqueness_of(:comic_id) }
end
