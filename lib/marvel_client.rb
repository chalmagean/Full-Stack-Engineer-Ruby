class MarvelClient
  PER_PAGE = 20

  def self.comics(params)
    if character_id = self.find_character(params)
      marvel_client.
        character_comics(
          character_id,
          offset: offset(params),
          orderBy: 'modified'
        )
    else
      marvel_client.comics(offset: offset(params), orderBy: 'modified')
    end
  end

  private

    def self.page(params)
      params[:page].presence || 1
    end

    def self.offset(params)
      page(params).to_i * PER_PAGE
    end

    def self.marvel_client
      mclient = Marvel::Client.new

      mclient.configure do |config|
        config.api_key = Settings.marvel.public_key
        config.private_key = Settings.marvel.private_key
      end

      mclient
    end

    def self.find_character(params)
      return nil if params[:query].blank?

      marvel_client.
        characters(name: params[:query]).
        try(:first).
        try(:id)
    end
end
