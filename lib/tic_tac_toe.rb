class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def board=(board)
    @board = board
  end
  def board
    @board
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = (input).to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true 
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end 
  
  def turn_count
    counter = 0 
    @board.each do |a|
      if a == "X" || a == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end
  
  def full?
    @board.all? do |spaces|
      spaces == "X" || spaces == "O"
    end
  end

  def draw?
    if !won? && full?
      return true
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  
  def play
    counter = 0 
    until counter == 9
      turn
      counter += 1
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      winner == "X" || winner == "O"
        puts "Congratulations #{winner}!"
    else draw?
        puts "Cat's Game!"
    end
  end
end