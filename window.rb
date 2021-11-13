#writen by Taylor Birchem (10/19/2021)
#last modified by Taylor Birchem (11/11/2021)

require 'ruby2d'

set background:'white'
set width: 300, height: 200

puts board = [
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",
  " "," "," "," ",]

def display_board
     puts row = ["   " "|" "   " "|" "   "]
     puts separator = "-----------"
     puts row
     puts separator
     puts row
end  

display_board(board)

class Bunnies
  #input for bunnies
    puts "How many bunnies would you like: "
    bunnies = gets.chomp
    puts(bunnies + " Bunnies")
  end

i = bunnies

while i > 0


show
