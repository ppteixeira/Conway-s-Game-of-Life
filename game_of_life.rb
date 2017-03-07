require 'io/console'
require "./app/board"

system 'clear'
puts "--------------------------------------"
puts "-  Welcome to Conway's Game of Life  -"
puts "--------------------------------------"
puts "  *** Implemented by Pedro Araujo *** "
3.times {puts ''}

begin
  puts "\t\tMENU:"
  puts "\t1 - Quick Start the game"
  puts "\t2 - Customized game"
  puts "\t3 - Quit "
  3.times {puts ''}
  print "---> "

  option = $stdin.getch

  if  option < '1' || option > '3'
    system 'clear'
    puts "--------------------------------------"
    puts "- #{option}   OPTION INVALID! Try again...   -"
    puts "--------------------------------------"
  end
end until option == '1' || option == '2' || option == '3'

case option
when '1' then Board.new
when '2' then Board.new(true)
when '3'
  puts ''
  puts "--------------------------------------"
  puts "-         Bye, See you soon!         -"
  puts "--------------------------------------"
  exit
end
