require 'io/console'
require_relative 'pokemon'
def print_grid(grid)
    grid.each do |row|
        row.each do |col|
            print col
        end
        puts
    end
end

display_grid = Array.new(10){Array.new(10){"~"}}
hidden_grid = Array.new(10){Array.new(10){"~"}}
pokedex = []
x =0
y = 0
display_grid[x][y] = "A"
hidden_grid[5][5] = Pokemon.new("Zubat",5,5)
hidden_grid[5][6] = Pokemon.new("Pidgey",5,6)
hidden_grid[5][7] = Pokemon.new("Charmander",5,7)
hidden_grid[5][8] = Pokemon.new("Caterpie",5,8)
hidden_grid[5][9] = Pokemon.new("Metapod",5,9)
hidden_grid[1][5] = Pokemon.new("Bulbasaur",1,5)
input = "Y"
while input != "x"
    #system "cls"
    print_grid(display_grid)
    puts pokedex
    puts "Please enter a direction you'd like to move: w,a,s,d"
    direction = STDIN.getch.downcase
    if (direction == "w" || direction == "a"|| direction == "s"|| direction == "d")
        display_grid[x][y] = "~"
        case direction
        when "w"
            x -= 1
        when "a"
            y -= 1
        when "s"
            x += 1
        when "d"
            y += 1
        end
        if (hidden_grid[x][y].is_a? Pokemon)
            puts "A wild #{hidden_grid[x][y].name} was caught!"
            pokedex.push(hidden_grid[x][y].name)
            hidden_grid[x][y] = "~"
        end
        display_grid[x][y] = "A"

    elsif (direction == "x")
        input = "x"
    end
end

