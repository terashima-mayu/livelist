if !(Rails.env.production? && ENV['ASSET_PRECOMPILATION'] == 'true')
  Rails.logger.info "Authenticating with Spotify API"
  RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
else
  Rails.logger.info "Skipping Spotify API authentication during asset precompilation"
end

