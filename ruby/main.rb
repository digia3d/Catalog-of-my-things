require_relative 'app'

def main
  print "\nWelcome to catalog of my things\n"
  app = App.new
  app.start
end

main
