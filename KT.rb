class KST
	attr_reader :queue

	def initialize(pos)
		@root = Knight.new(pos, 0)
		@queue = [@root]
	end

	def search(final)
		move_count = 1

		until @queue.empty? do 

      if @queue[0].pos == final #To check if we have found the final position
        puts "You got there in #{@queue[0].move} moves!" 

        current_move = @queue[0]
        until current_move == @root
          puts "Move ##{current_move.move}: #{current_move.pos}"
          current_move = current_move.previous_move
        end

        puts "Original: #{@root.pos}"

        return

      end
          

			@queue[0].generate_moves(move_count) #To generate the next moves

			@queue << @queue[0].m1 unless @queue[0].m1.nil? # and append the moves to the end of queue
			@queue << @queue[0].m2 unless @queue[0].m2.nil?
			@queue << @queue[0].m3 unless @queue[0].m3.nil?
			@queue << @queue[0].m4 unless @queue[0].m4.nil?
			@queue << @queue[0].m5 unless @queue[0].m5.nil?
			@queue << @queue[0].m6 unless @queue[0].m6.nil?
			@queue << @queue[0].m7 unless @queue[0].m7.nil?
			@queue << @queue[0].m8 unless @queue[0].m8.nil?

			@queue.shift # then progress the queue

			move_count += 1 # and at this stage, we need to move again.

		end
		nil
	end
end

class Knight
	attr_reader :pos, :move, :previous_move, :m1, :m2, :m3, :m4, :m5, :m6, :m7, :m8

	def initialize(pos, move=nil, previous_move=nil)
		@pos = pos
    @move = move
    @previous_move = previous_move
		@m1 = nil
		@m2 = nil
		@m3 = nil
		@m4 = nil
		@m5 = nil
		@m6 = nil
		@m7 = nil
		@m8 = nil
	end

	def generate_moves(num)
		@m1 = Knight.new([@pos[0]-2, @pos[1]-1], self.move + 1, self) if is_on_board?([@pos[0]-2, @pos[1]-1])
		@m2 = Knight.new([@pos[0]-1, @pos[1]-2], self.move + 1, self) if is_on_board?([@pos[0]-1, @pos[1]-2])
		@m3 = Knight.new([@pos[0]+1, @pos[1]-2], self.move + 1, self) if is_on_board?([@pos[0]+1, @pos[1]-2])
		@m4 = Knight.new([@pos[0]+2, @pos[1]-1], self.move + 1, self) if is_on_board?([@pos[0]+2, @pos[1]-1])
		@m5 = Knight.new([@pos[0]-2, @pos[1]+1], self.move + 1, self) if is_on_board?([@pos[0]-2, @pos[1]+1])
		@m6 = Knight.new([@pos[0]-1, @pos[1]+2], self.move + 1, self) if is_on_board?([@pos[0]-1, @pos[1]+2])
		@m7 = Knight.new([@pos[0]+1, @pos[1]+2], self.move + 1, self) if is_on_board?([@pos[0]+1, @pos[1]+2])
		@m8 = Knight.new([@pos[0]+2, @pos[1]+1], self.move + 1, self) if is_on_board?([@pos[0]+2, @pos[1]+1])
  end

	private

	def is_on_board?(pos)
		pos[0].between?(0,7) && pos[1].between?(0,7) ? true : false
	end
end

sir_henry = KST.new([4,2])
p sir_henry.search([3,6])
