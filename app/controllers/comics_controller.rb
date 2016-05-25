class ComicsController < ApplicationController
  def index
    @comics = MarvelClient.comics(params)
    @votes = Vote.all.map(&:comic_id)

    respond_to do |format|
      format.html {}
      format.json { render json: @comics }
    end
  end
end
