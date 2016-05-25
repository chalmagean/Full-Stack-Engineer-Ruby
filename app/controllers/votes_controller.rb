class VotesController < ApplicationController
  def create
    @vote = Vote.new(comic_id: params.require(:comic_id))

    if @vote.save
      respond_to do |format|
        format.json { render json: @vote }
      end
    else
      respond_to do |format|
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end
end
