class ComicsController < ApplicationController
  def index
    @comics = marvel_client.comics
    @votes = Vote.all.map(&:comic_id)
  end

  private

    def marvel_client
      @client ||= begin
        mclient = Marvel::Client.new

        mclient.configure do |config|
          config.api_key = Settings.marvel.public_key
          config.private_key = Settings.marvel.private_key
        end

        mclient
      end
    end
end
