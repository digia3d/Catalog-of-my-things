require_relative 'book'

class App
  def initialize
    @name = 'John Doe'
    @books = []
    @labels = []
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp.downcase
    print 'Publish Date (yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is the book archived? (Y/N): '
    archived_str = gets.chomp
    archived = %w[Y YES].include?(archived_str.upcase)

    book = Book.new(publisher, cover_state, publish_date, archived)
    @books << book
    print "\n Book Created Successfully 🎉 \n"
  end
end
