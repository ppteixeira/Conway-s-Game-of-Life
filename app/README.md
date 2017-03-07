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
  Create a board with those dimensions and inside each column inserts an instance of `class Cell`.
  From this point it calls the method `start_game` which controls the sequence of actions.
  During the loop those actions take place in this order:
  * Waits for half second
  * The board will be shown at the terminal
  * Each cell looks for it's neighbours and store how many are alive
  * It runs a round of the changes, according to the rules

### Cell  
