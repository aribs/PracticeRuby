

class Game
	def initialize player
		@player = player
		@rooms = []
	end
	def add_room room
		@rooms << room
	end
	def show_room id #Busca una habitación por su ID, muestra su mensaje
		room = get_room id
		puts room.message
	end
	def get_room id
		room = @rooms.find{|room| id == room.id}
	end
	def play
		play = true
		while play
			show_room @player.position
			move
			
		end
	end
	
	def move
	
		room = get_room @player.position
		direction = answerDirection
		possible_directions = room.rute.keys
		if possible_directions.include? direction
			@player.position = room.rute[direction]
		else
			puts "No possible change room"
		end


	end
	def answerDirection
		puts "Choose your new direction, n,s,w,e \n >"
		direction = gets.chomp.to_sym
		
	end
	def comp_route

	end

end
class Room
	attr_accessor :id, :rute, :message
	def initialize id, rute, message #Id de la habitación, rutas disponible, mensaje habitación.
		@id = id
		@rute = rute
		@message = message
	end



end
class Player
	attr_accessor :position
	def initialize position
		@position = position
	end
end
cabezon = Player.new 1
my_game = Game.new cabezon
room1 = Room.new 1, { :E => 2, :S => 4 }, "You're in room 1"
room2 = Room.new 2, { :E => 3, :W => 1 }, "You're in room 2"
room3 = Room.new 3, { :S => 6, :W => 2 }, "You're in room 3"
room4 = Room.new 4, { :N => 1, :E => 5, :S => 7 }, "You're in room 4"
room5 = Room.new 5, { :S => 8, :W => 4 }, "You're in room 5"
room6 = Room.new 6, { :N => 3 }, "You're in room 6"
room7 = Room.new 7, { :N => 4, :E => 8, :S => 10 }, "You're in room 7"
room8 = Room.new 8, { :N => 5, :E => 9, :W => 7 }, "You're in room 8"
room9 = Room.new 9, { :S => 12, :W => 8 }, "You're in room 9"
room10 = Room.new 10, { :N => 7, :E => 11 }, "You're in room 10"
room11 = Room.new 11, { :W => 10 }, "You're in room 11"
room12 = Room.new 12, { :N => 9, :E => "EXIT" }, "You're in room 12"
room13 = Room.new "EXIT", { :W => 12 }, "`You're outside!"
my_game.add_room room1
my_game.add_room room2
my_game.add_room room3 
my_game.add_room room4 
my_game.add_room room5 
my_game.add_room room6 
my_game.add_room room7 
my_game.add_room room8 
my_game.add_room room9 
my_game.add_room room10 
my_game.add_room room11 
my_game.add_room room12 
my_game.add_room room13
my_game.play

