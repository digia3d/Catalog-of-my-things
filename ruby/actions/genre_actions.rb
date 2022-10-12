require_relative '../file_reader'
require_relative '../file_writer'
require_relative '../genre'

def write_genres(genres)
  genres = genres.map do |genre|
    {
      name: genre.name
    }
  end

  file_writer = FileWriter.new(genres, 'genres.json')
  file_writer.write
end

def read_genres
  file_reader = FileReader.new('genres.json')
  genres = file_reader.read
  genres.map do |genre|
    Genre.new(
      genre['name']
    )
  end
end
