# require 'pry-byebug'
require 'pry'

require_relative './ruby_classes/book_label_methods'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  include BookLabelMethods

  def handle_action(option)
    case option
    when 1
      list_all_books(@books)
    when 2
      puts 'list_all_music_albums'
    when 3
      puts 'list_all_games'
    when 4
      puts 'list_all_genres'
    when 5
      list_all_labels(@labels)
    when 6
      puts list_all_authors
    when 7
      add_book(@books, @labels)
    when 8
      puts 'add_music_album'
    when 9
      puts 'add_game'
    when 11
      exit
    end
  end
end
