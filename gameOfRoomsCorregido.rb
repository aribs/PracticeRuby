def help
   puts "******** HELP *********"
   puts "Character.move(direction): Move to that direction."
   puts "Character"


   puts "***********************"
end




class Game

   def initialize #character
       #@character = character
       @rooms = []
       
   end

   def add_room room
       @rooms << room
   end

   def show_room id
          room = @rooms.find{|room| id == room.id }
          room.message
   end

   def get_room id
       room @rooms.find{|room| id == room.id }
       return room
   end
=begin
   def play

       playing = true

       while playing
           show_room @character.position
           direction = get_direction
           execute_direction direction 
       end

   end
=end


end

class Room

   attr_accessor :id, :paths, :message

   def initialize id, paths, message
       @id = id
       @paths = paths
       @message = message
   end

end

class Character

   attr_accessor :position, :game

   def initialize game, position
       @position = position # el numero de habitacion donde se encuentra
       @game = game
   end
   def move direction
       movement = direction.upcase.to_sym
       room = @game.get_room @position
       new_room_n = room.call[movement]
       @position = new_room_n
       puts "Movint to room #{@position}."
   end

   def show_room
       puts "You're in room #{position}"
   end

end


room1 = Room.new(1, { :W => 8, :S => 2}, "You are in the room 1")
room2 = Room.new(2, { :N => 1}, "You are in the room 2")
room8 = Room.new(8, { :E => 1}, "You are in the room 8")

game = Game.new


game.add_room room1
game.add_room room2
game.add_room room8

game.show_room 8


link = Character.new(game,1)
link.show_room