class Main
  def welcome
    puts 'Hiya, welcome to your catalog of things!'
    puts "====================================\n\n"
    full_list
  end

  def full_list
    puts "\n"
    puts 'Please choose an option by entering a number:'
    options = ['List all books', 'List all music albums', 'List of games', 'List all labels (e.g. "Gift", "New")', 'List all genres (e.g "Pop", "Bachata")',
               'List all authors (e.g. "Stephen King")', 'Add a book', 'Add a music album', 'Add a game', 'Exit']
    options.each.with_index(1) do |option, index|
      puts "#{index}. #{option}"
    end
    puts "\n"
    main_input = gets.chomp.to_i
    listed_sections(main_input)
  end

  def listed_sections(user_input)
    case user_input
    when 1
      # list_book method
      full_list
    when 2
      # list_albums method
      full_list
    when 3
      # list_games method
      full_list
    when 4
      # list_labels method
      full_list
    when 5
      # list_genres method
      full_list
    when 6
      # list_authors method
      full_list
    when 10
      puts 'Exiting app... We hope to see you soon!'
    else
      creators(user_input)
    end
  end

  def creators(creator_input)
    case creator_input
    when 7
      # create_book method
      full_list
    when 8
      # create_album method
      full_list
    when 9
      # create_game method
      full_list
    end
  end
end

main = Main.new
main.welcome
