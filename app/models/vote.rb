class Vote < ActiveRecord::Base
  validates :comic_id, presence: true, uniqueness: true
end
