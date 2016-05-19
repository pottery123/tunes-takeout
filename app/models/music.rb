#look at the gems
class Music
  attr_reader :artist, :albums, :track

  def initialize(input)

    @aritst =  RSpotify::Artist.find(input)
    @albums = RSpotify::Album.find(input)
    @track = RSpotify::Track.find(input)
  end

  def self.find_artist(artist_id)


    artist = @artist = RSpotify::Artist.find(artist_id)
    #@artist = self.new(artist)#show music object in view
    artist



  end

  def self.find_album(album_id)
    album = @albums= RSpotify::Album.find(album_id)
    album #@album = self.new(album)

  end

  def self.find_track(track_id)
    track =   @track= RSpotify::Track.find(track_id)
    track #@track = self.new(track)

  end

end
