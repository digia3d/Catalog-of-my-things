require_relative '../file_writer'
require_relative '../file_reader'
require_relative '../book'

def write_books(books)
  books = books.map do |book|
    {
      publisher: book.publisher,
      cover_state: book.cover_state,
      publish_date: book.publish_date,
      archived: book.archived
    }
  end
  file_writer = FileWriter.new(books, 'books.json')
  file_writer.write
end

def load_books
  file_reader = FileReader.new('books.json')
  books = file_reader.read
  books.map do |book|
    Book.new(
      book['publisher'],
      book['cover_state'],
      book['publish_date'],
      book['archived']
    )
  end
end
