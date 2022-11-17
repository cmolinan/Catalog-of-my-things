# require 'pry'
require './ruby_classes/music_album'
require './ruby_classes/music_genre'
require './ruby_classes/book'
require './ruby_classes/label'
require './ruby_classes/game'
require './ruby_classes/author'
require './modules/music_album_module'
require './modules/music_genre_module'
require './modules/book_module'
require './modules/label_module'
require './modules/game_module'
require './modules/author_module'
require 'Date'

class App
  include MusicAlbumDataController
  include MusicGenresDataController
  include BooksDataController
  include LabelsDataController
  include GameController
  include AuthorController

  def initialize
    @books = load_books
    @games = load_game
    @labels = load_labels
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

  def list_all_music_album
    puts 'List of All Music Albums:'
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}) Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_genres
    puts 'List of Genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre.name}"
    end
  end

  def list_all_game
    puts 'Games'
    @games.each_with_index do |game, index|
      puts "[#{index}] Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at},
      Publish Date: #{game.publish_date}"
    end
  end

  def list_all_authors
    puts "LIST OF AUTHORS:\n\n"
    @authors.each_with_index do |author, index|
      puts "[#{index}] #{author.first_name} #{author.last_name}"
    end
  end

  def add_book
    print "\nPublisher: "
    publisher = gets.chomp
    print 'Cover State: '
    cover = gets.chomp
    print 'Publish Date: '
    date = gets.chomp

    if publisher.strip != '' && cover.strip != '' && date != ''
      book = Book.new(publisher, cover, date)
      @books << book
      puts "\nBook created successfully !\n\n"
      add_label(@labels)
    else
      puts "\nMust enter complete data to create a book"
    end
  end

  def add_label(db_labels)
    print 'Title: '
    title = gets.chomp
    print 'Label Color: '
    color = gets.chomp

    return unless title.strip != '' && color.strip != ''

    label = Label.new(title, color)
    db_labels << label
    puts "\nLabel created successfully !\n"
  end

  def list_all_books
    puts ''
    if @books.empty?
      puts('No Books Available')
    else
      puts "LIST OF ALL BOOKS -->\n"
    end
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Publisher: #{book.publisher}, Cover_state: #{book.cover_state}, Publish_date: #{book.publish_date}"
    end
  end

  def list_all_labels
    puts ''
    if @labels.empty?
      puts('No Labels Available')
    else
      puts "LIST OF ALL LABELS -->\n"
    end
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end

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
    print 'Game\'s author first name:'
    first_name_author = gets.chomp.capitalize

    print 'Game\'s author last name:'
    last_name_author = gets.chomp.capitalize

    print 'Is the game multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y' || false

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = get_date_from_user(gets.chomp)
    return unless publish_date

    print 'Enter the last time you played it by date [Enter date in format (yyyy-mm-dd)]: '
    last_played_at = get_date_from_user(gets.chomp)
    return unless last_played_at

    new_game = Game.new(multiplayer, last_played_at, publish_date)

    # Game's author
    new_author = Author.new(first_name_author, last_name_author)
    new_author.add_item(new_game)

    @games << new_game
    @authors << new_author
    puts 'Well done, game created successfully'
  end

  def get_date_from_user(data)
    Date.parse(data)
  rescue ArgumentError
    puts 'Wrong date format'
    false
  end

  def save_data
    save_books
    save_labels
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
      add_book
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
      list_all_game
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    end
  end
end
