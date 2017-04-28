class TicTacToe

##Create an empty board
  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  ##Win circumstances
  WIN_COMBINATIONS = [
    [0,1,2], #Top horizontal
    [3,4,5], #Middle horizontal
    [6,7,8], #Bottom horizontal
    [0,3,6], #Left vertical
    [1,4,7], #Middle vertical
    [2,5,8], #Right vertical
    [0,4,8], #Left corner diagonal
    [2,4,6] #Right corner diagonal
  ]

  def display_board
  puts row = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts row = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts row = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

#Convert input to index number
  def input_to_index(input)
  index = input.to_i - 1
  end

#Fill in board array with tokens(X,O)
  def move(index,character)
  @board[index] = character
  display_board
  end

#Helper to valid_move
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

#Is move valid?
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
    else
      turn
    end
  end

##Number of turns that have been played
  def turn_count
    counter = 0
    @board.each do |member|
      if member == "X" || member == "O"
        counter +=1
      end
    end
  return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end


##DETERMINE WINS##
  def won?
    WIN_COMBINATIONS.detect do |winning_array|
      if winning_array.all?{|index_num| @board[index_num] == "X"}
        winning_array.inspect
      elsif winning_array.all?{|index_num| @board[index_num] == "O"}
        winning_array.inspect
      end
    end
  end

  def full?
    @board.none?{|i| i == "" || i == " "}
  end

  def draw?
    won?.nil? && full? == true
  end

  def over?
  won? || full? || draw?
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
  end

##Tie together- play game
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end