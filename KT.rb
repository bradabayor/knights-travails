#!/usr/bin/env ruby

class Knight
  attr_reader :position, :next_move1

  def initialize(position)
    @position = position
    @next_move1 = nil
    @next_move2 = nil
    @next_move3 = nil
    @next_move4 = nil
    @next_move5 = nil
    @next_move6 = nil
    @next_move7 = nil
    @next_move8 = nil
  end

  def calc_possible_moves
    @moves = []
    @moves << [@position[0]-2, @position[1]-1]
    @moves << [@position[0]-1, @position[1]-2]
    @moves << [@position[0]+1, @position[1]-2]
    @moves << [@position[0]+2, @position[1]-1]
    @moves << [@position[0]-2, @position[1]+1]
    @moves << [@position[0]-1, @position[1]+2]
    @moves << [@position[0]+1, @position[1]+2]
    @moves << [@position[0]+2, @position[1]+1]
    @moves.select { |move| is_on_board?(move) }
  end

  def link_next_moves
    @next_move1 = Knight.new(@moves[0]) unless @moves[0].nil?
    @next_move2 = Knight.new(@moves[1]) unless @moves[1].nil?
    @next_move3 = Knight.new(@moves[2]) unless @moves[2].nil?
    @next_move4 = Knight.new(@moves[3]) unless @moves[3].nil?
    @next_move5 = Knight.new(@moves[4]) unless @moves[4].nil?
    @next_move6 = Knight.new(@moves[5]) unless @moves[5].nil?
    @next_move7 = Knight.new(@moves[6]) unless @moves[6].nil?
    @next_move8 = Knight.new(@moves[7]) unless @moves[7].nil?
  end

  def is_on_board?(move)
    move.each do |num|
      return false if num 0 || num > 7
    end
    true
  end

  def breadth_first_search(final_position)
    queue = [@root]
end

class KnightSearchTree
  attr_accessor :root

  def initialize(position)
    @root = Knight.new(position)
  end

  def search(final_position)
    queue = [@root]
  end


end

sir_henry = Knight.new([1,1])
sir_henry.calc_possible_moves
sir_henry.link_next_moves
p sir_henry.next_move1