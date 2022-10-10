class App
  def initialize
    @running = true
  end

  def start
    while @running
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

      option = gets.chomp.to_i
      case option
      when 13
        @running = false
        print 'Thanks for using the app!'
      else
        print "Invalid option... Choose one of the options above\n"
      end
    end
  end
end
