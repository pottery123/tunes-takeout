#look at the gems
class Music
  BASE_URL = "https://api.spotify.com/v1/"

  def self.find_playlist(user_id)
    #find a playlist with a passed id
    data = HTTParty.get(BASE_URL + "users/#{user_id}/playlists").parsed_response
    self.new(data)

  end


  def self.find_artist(music_id)
    #all artist finding one artist with the music_id
    data = HTTParty.get(BASE_URL + "artists/#{music_id}").parsed_response
    self.new(data)
  end

  def self.find_album(music_id)
    data = HTTParty.get(BASE_URL + "albums/#{music_id}").parsed_response
    self.new(data)
  end


end
