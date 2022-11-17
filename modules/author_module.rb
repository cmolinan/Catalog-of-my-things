require './ruby_classes/author'
require 'json'

module AuthorController
  def load_author
    file = './json_files/author.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |ele|
        data.push(Author.new(ele['first_name'], ele['last_name']))
      end
    end
    data
  end

  def add_author
    data = []
    @authors.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    File.write('./json_files/author.json', JSON.generate(data))
  end
end
