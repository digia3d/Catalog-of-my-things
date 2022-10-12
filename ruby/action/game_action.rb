require_relative '../file_reader'
require_relative '../file_writer'
require_relative '../game'

def write_games(games)
  games = games.map do |game|
    {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      publish_date: game.publish_date
    }
  end
  file_writer = FileWriter.new(games, 'games.json')
  file_writer.write
end

def load_games
  file_reader = FileReader.new('games.json')
  games = file_reader.read
  games.map do |game|
    Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
  end
end
