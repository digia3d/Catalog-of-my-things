require_relative '../file_reader'
require_relative '../file_writer'
require_relative '../author'

def write_authors(authors)
  authors = authors.map do |author|
    {
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
  file_writer = FileWriter.new(authors, 'authors.json')
  file_writer.write
end

def load_authors
  file_reader = FileReader.new('authors.json')
  authors = file_reader.read
  authors.map do |author|
    Author.new(author['first_name'], author['last_name'])
  end
end
