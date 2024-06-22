unless Rails.env.production? && ENV['ASSET_PRECOMPILATION'] == 'true'
  RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
end
