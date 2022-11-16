require_relative './ruby_classes/music_album'
require 'json'

module MusicAlbumDataController
  def load_albums
    if File.exist?('album.json')
      JSON.parse(File.read(album.json)).map do |album|
        publish_date = Times.new.year
        MusicAlbum.new(ID: album['id'], Name: album['name'], Publish_date: album[publish_date],
                       Spotify: album['on_spotify'])
      end
     else
      []
    end
  end

  def save_albums
    
  end
end
