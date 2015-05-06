class Player
	def initialize pos
		@position = pos
	end
	def move_n
		puts ("You are in the Nord Room, is very cold room. \n Like a penguins?")
		@position = 'n'
	end
	def move_w
		puts ("You are in the West Room")
		@position = 'w'
	end
	def move_s
		puts ("You are in the Sud Room")
		@position = 's'
	end
	def move_e
		puts ("You are in the East Room")
		@position = 'e'
	end
	def answer_move
		puts ("Please, select your direction, please type n,s,w,e \n >")
		answer = gets.chomp
		if is_input_correct? answer
			if validate_move? answer
				change_room answer
			else
				puts("You not move here, is your position")
			end
		else
			puts ("please insert a valid character: n,s,w,e")
			answer_move
		end

	end
	def change_room answer
		case answer
		when 'n'
			move_n
		when 's'
			move_s
		when 'w'
			move_w
		when 'e'
			move_e
		end
	end
	def validate_move? answer
		answer != @position
	end
	def is_input_correct? answer
		answer != 'n' || answer != 's' || answer != 'w' || answer != 'e'
	end
end

pj = Player.new 'n' 
pj.answer_move 
pj.answer_move 
