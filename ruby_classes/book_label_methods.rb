require 'pry-byebug'
require_relative 'book'
require_relative 'label'

module BookLabelMethods
  def add_book(db_books, db_labels)
    print "\nPublisher: "
    publisher = gets.chomp
    print 'Cover State: '
    cover = gets.chomp
    print 'Publish Date: '
    date = gets.chomp

    if publisher.strip != '' && cover.strip != '' && date != ''
      book = Book.new(publisher, cover, date)
      db_books << book
      puts "\nBook created successfully !\n\n"
      add_label(db_labels)
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

  def list_all_books(db_books)
    puts ''
    if db_books.empty?
      puts('No Books Available')
    else
      puts "LIST OF ALL BOOKS -->\n"
    end
    db_books.each_with_index do |book, index|
      puts "#{index + 1}) Publisher: #{book.publisher}, Cover_state: #{book.cover_state}, Publish_date: #{book.publish_date}"
    end
  end

  def list_all_labels(db_labels)
    puts ''
    if db_labels.empty?
      puts('No Labels Available')
    else
      puts "LIST OF ALL LABELS -->\n"
    end
    db_labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end
end
