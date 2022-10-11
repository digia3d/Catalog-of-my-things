require_relative 'app'

def main
  print "\nWelcome to catalog of my things\n"
  app = App.new
  loop do
    print_options
    option = gets.chomp.to_i

    handle_case(option, app)

    break if option == 13
  end
end

def handle_case(option, app)
  case option
  when 1
    app.list_books
  when 6
    app.list_labels
  when 9
    app.add_book
  when 13
    print 'Thanks for using the app!'
  else
    print "Invalid option... Choose one of the options above\n"
  end
end

def print_options
  puts "
   1. List all books
   2. List all music albums
   3. List all movies
   4. List of games
   5. List all genres
   6. List all labels
   7. List all authors
   8. List all sources
   9. Add a book
  10. Add a music album
  11. Add a movie
  12. Add a game
  13. Exit
  "
end

main
