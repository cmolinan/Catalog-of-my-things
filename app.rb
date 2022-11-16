require './ruby_classes/music_album'
require './ruby_classes/music_genre'
require './modules/music_album_module'
require './modules/music_genre_module'
require 'Date'

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

  def list_all_genres
    puts 'Genres'
    @genres.each do |genre|
      puts "Name: #{genre.name}"
    end
  end

  def list_all_games; end

  def list_all_labels; end

  def list_all_authors; end

  def add_book; end

  def add_music_album
    print 'Please, type the album name: '
    name = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = get_date_from_user(gets.chomp)
    return unless publish_date

    print 'Has present in spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums << MusicAlbum.new(name, publish_date, on_spotify)
    puts 'Album created successfully'
  end

  def add_game; end

  def get_date_from_user(data)
    Date.parse(data)
  rescue ArgumentError
    puts 'Wrong date format'
    false
  end

  def save_data
    # save_books
    # save_labels
    # add_author
    # save_game
    save_albums
    save_genres 
  end

  private

  def handle_valid_actions(action)
    case action
    when 1..6
      handle_valid_view_data_actions(action)
    when 7
      # add_book
    when 8
      add_music_album
    when 9
      # add_game
    end
  end

  def handle_valid_view_data_actions(action)
    case action
    when 1
      list_all_books
    when 2
      list_all_music_album
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    end
  end
end
