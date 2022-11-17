require './ruby_classes/game'
require 'json'

module GameController
  def load_game
    file = './json_files/game.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |ele|
        data.push(Game.new(ele['multiplayer'], ele['last_played_at'], ele['publish_date']))
      end
    end
    data
  end

  def save_game
    data = []
    @games.each do |game|
      data.push({ multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date })
    end
    File.write('./json_files/game.json', JSON.generate(data))
  end
end
