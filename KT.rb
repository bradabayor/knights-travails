#!/usr/bin/env ruby

class Knight
  def initialize(position)
    @position = position
  end

  def print_possible_moves
    moves = []
    moves << [@position[0]-2, @position[1]-1]
    moves << [@position[0]-1, @position[1]-2]
    moves << [@position[0]+1, @position[1]-2]
    moves << [@position[0]+2, @position[1]-1]
    moves << [@position[0]-2, @position[1]+1]
    moves << [@position[0]-1, @position[1]+2]
    moves << [@position[0]+1, @position[1]+2]
    moves << [@position[0]+2, @position[1]+1]
    moves.select { |move| is_on_board?(move)}
  end

  def is_on_board?(move)
    move.each do |num|
      return false if num < 0 || num > 7
    end
    true
  end
end

p sir_henry = Knight.new([1,1])
p sir_henry.print_possible_moves