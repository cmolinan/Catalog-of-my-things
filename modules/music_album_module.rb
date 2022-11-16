require './ruby_classes/music_album'
require 'json'

module MusicAlbumDataController
  def load_albums
    if File.exist?('./json_files/album.json') && File.read('./json_files/album.json') != ''
      JSON.parse(File.read('./json_files/album.json')).map do |album|
        MusicAlbum.new(album['name'], album['publish_date'], album['spotify'])
      end
    else
      []
    end
  end

  def save_albums
    data = []
    @music_albums.each do |album|
      data.push({ name: album.name, publish_date: album.publish_date, spotify: album.on_spotify })
    end
    open('./json_files/album.json', 'w') { |f| f << JSON.generate(data) }
  end
end
