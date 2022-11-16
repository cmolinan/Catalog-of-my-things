require './ruby_classes/music_album'
require './ruby_classes/music_genre'
require './modules/music_album_module'
require './modules/music_genre_module'

class App
  include MusicAlbumDataController
  include MusicGenresDataController

  def initialize
    @books = []
    @games = []
    @labels = []
    @authors = []
    @music_albums = load_albums
    @genres = load_genres
  end

  def handle_action(option)
    case option
    when 1..10
      handle_valid_actions(option)
    else
      puts 'Please put a number between 1 and 10'
    end
  end

  def list_all_books; end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
   end

  def list_all_games; end

  def list_all_genres; end

  def list_all_labels; end

  def list_all_authors; end

  def add_book; end

  def add_music_album; end

  def add_game; end
end
