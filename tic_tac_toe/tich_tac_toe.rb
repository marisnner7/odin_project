# frozen_string_literal: true

class TicTacToe
  attr_accessor :board
  def initialize
    @board = [' ', ' ', '',
              ' ', ' ', '',
              ' ', ' ', '']
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def display_board
    puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
    puts '------------'
    puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
    puts '------------'
    puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token = 'X')
    @board[position] = token
  end

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn
    puts 'choose a spot between 1-9'
    spot = gets.chomp
    spot = input_to_index(spot)
    if valid_move?(spot)
      move(spot, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    taken = 0
    @board.each do |i|
      taken += 1 if i == 'X' || i == 'O'
    end
    taken
  end

  def current_player
    player = nil
    player = if turn_count.even?
               'X'
             else
               'O'
             end
    player
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    won = ''
    if winner = won?
      won = @board[winner.first]
    end
  end

  def play
    turn until over?

    if won?
      winner = winner()
      puts "Good Call #{winner}"
    else
      'Try Again'
    end
  end
end

game = TicTacToe.new
game.play
