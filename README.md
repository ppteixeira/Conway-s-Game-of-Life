# Conway's Game of Life

## Requirements

1. Assume a fixed size board, eg 80 columns by 20 rows
1. To start the game, randomly set each cell on the board either ON or OFF
1. Print the status of the board to the screen
1. Enter an infinite loop:
  1. Wait half a second
  1. Produce a new "tick" of the board
  1. Print the status of the board to the screen


* Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At eafch step in time, the following transitions occur:

* Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by overpopulation.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

* The initial pattern constitutes the seed of the system.
* The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one).
* The rules continue to be applied repeatedly to create further generations.


## Building

### Board

  The first thing to be done was the `Class Board`.

  It initialises with a default size of 20 rows and 80 columns

  Creates a board with those dimensions and inside each column inserts an instance of `class Cell`.

  From this point it calls the method `start_game` which controls the sequence of actions.

  During the loop those actions take place in this order:
  * Waits for half second
  * The board will be shown at the terminal
  * Each cell looks for it's neighbours and store how many are alive
  * It runs a round of the changes, according to the rules

### Cell  

  Each cell is initialized with two parameters `row` and `column` that is their position on the board.
  Once they are created they wait for method calls to perform any action.

  Their first method called is `print_on_screen`, called by `Board.show_board`, that returns the character to be printed according to it's `@state` (`"ON"` || `"OFF"`).

  The methods `is_on?`, `turn_on` and `turn_off` are methods to check and change the value of `@state`.

  `find_neighbours` sets the number of cell's neighbours alive.

  And lastly `play_next_move` has applies the rules to change or not the `@state` .

## Running

  To run, simply type on terminal:

```
ruby game_of_life.rb
```  
  Follow the instructions on the screen.
___

## Personal thoughts

  Conway' Game of life is very interesting.
  It is a bit confusing to understand what is going on at the beginning but once you get it, it's really fun.
  Overall I had a good experience doing it and it's a shame that using ruby and the terminal the character size does not help much when outputting it. It does not look as great and symmetric ,but it does the job.

### Hard bits
  I have spent some extra time with the logic to find the neighbours and avoid counting the cell itself, and also limiting counting the neighbours that are valid board positions. I had a few mistakes that took me a bit longer to realise what was wrong.
