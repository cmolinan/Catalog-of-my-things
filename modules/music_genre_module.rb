require './ruby_classes/music_genre'
require 'json'

module MusicGenresDataController
  def load_genres
    if File.exist?('./json_files/genres.json') && File.read('./json_files/genres.json') != ''
      JSON.parse(File.read('./json_files/genres.json')).map do |genre|
        Genre.new(id: nil, name: genre['name'])
      end
    else
      []
    end
  end

  def save_genres
    data = []
    @genres.each do |genre|
      data.push({ name: genre.name })
    end
    open('./json_files/genre.json', 'w') { |f| f << JSON.generate(data) }
  end
end
