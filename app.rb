require './ruby_classes/music_album'
require './ruby_classes/music_genre'
require './ruby_classes/game'
require './ruby_classes/author'
require './ruby_classes/label'
require './modules/music_album_module'
require './modules/music_genre_module'
require './modules/game_module'
require './modules/author_module'
require 'Date'

class App
  include MusicAlbumDataController
  include MusicGenresDataController
  include AuthorModule
  include GameModule

  def initialize
    @books = []
    @games = load_game
    @labels = []
    @authors = load_author
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

  def list_all_games
    puts 'Games'
    @games.each do |game|
      puts "Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at},
      Publish Date: #{game.publish_date}"
    end
  end

  def list_all_labels; end

  def list_all_authors
      puts 'Authors'
      @authors.each do |author|
        puts "First Name: #{author.first_name} Last Name: #{author.first_name}"
      end
  end

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

  def add_game
      p 'Game\'s author first name:'
      first_name_author = gets.chomp.capitalize

      p 'Game\'s author last name:'
      last_name_author = gets.chomp.capitalize

      p 'Game\'s title:'
      game_title = gets.chomp.capitalize

      p 'Is the game multiplayer? [Y/N]: '
      multiplayer = gets.chomp.downcase == 'y' || false
  
      p 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
      publish_date = get_date_from_user(gets.chomp)
      return unless publish_date
  
      p 'Enter the last time you played it by date [Enter date in format (yyyy-mm-dd)]: '
      last_played_at = get_date_from_user(gets.chomp)
      return unless last_played_at

      p 'Game\'s genre? [Fantasy, Adventure, etc]:'
      game_genre = gets.chomp.capitalize
  
      new_game = Game.new(multiplayer, last_played_at, publish_date)

      # Game's author
      new_author = Author.new(first_name_author, last_name_author)
      new_author.add_item(new_game)

      # Game's name
      new_label = Label.new('', game_title, 'unknown')
      new_label.add_item(new_game)

      # Game's Genre
      new_genre = Genre.new('', game_genre)
      new_genre.add_item(new_game)

      @games << new_game
      @author << new_author
      @label << new_label
      @genre << new_genre
      puts 'Well done, game created successfully'
  end

  def get_date_from_user(data)
    Date.parse(data)
  rescue ArgumentError
    puts 'Wrong date format'
    false
  end

  def save_data
    # save_books
    # save_labels
    add_author
    save_game
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
      add_game
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
