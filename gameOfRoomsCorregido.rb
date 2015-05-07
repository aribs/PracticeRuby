class Game
    def initialize character, difficulty = 'noob'
        @character = character
        @rooms = []
        @room_paths_controller = []

        show_game_name

        puts 'You are a ' + @character.name + ' and you are naked'

        if difficulty.eql? 'noob'
            show_map
        end
    end

    def show_game_name
        puts '****************************************'
        puts 'MONKEY PARADISE Alpha 1.0, crafted by JC'
        puts '****************************************'
        puts ''
    end

    def show_map
        puts ''
        puts ' _________ '
        puts '|         |'
        puts '|         |'
        puts '| Armoury |'
        puts '|         |'
        puts '|         |'
        puts '|___   ___| _________ _________'
        puts '|         ||         |         |'
        puts '|         ||         |         |'
        puts '|   Leon       Main     Crazy  |'    
        puts '|   cage       room     wizard |'
        puts '|         ||         |         |'
        puts '|_________||_________|___   ___|'
        puts '                     |         |'
        puts '                     |         |'
        puts '                     |   Bomb  |'
        puts '                     |   room  |'
        puts '                     |         |'
        puts '                     |_________|'
        puts ''
    end

    def add_room room
        @rooms << room
    end

    def show_current_room number
        current_room = @rooms.find { |room| room.number == number }
        puts current_room.message
    end

    def use_gps number
        current_room = @rooms.find { |room| room.number == number.to_i }
        room_paths = current_room.paths

        room_paths.each do |direction, room|
            puts "You can enter in room #{room} (#{direction})"
        end
    end

    def enter_the_room
        puts 'In which room do you want to enter?'
        new_position = gets.chomp

        puts ''

        control_room_paths new_position

        show_current_room new_position.to_i
        @character.position = new_position        

        use_gps new_position

        enter_the_room
    end

    def control_room_paths new_position
        @room_paths_controller = []

        current_room = @rooms.find { |room| room.number == @character.position.to_i }
        room_paths = current_room.paths

        room_paths.each do |direction, room|
            @room_paths_controller.push room
        end

        puts @room_paths_controller[0].class
        puts @character.position.to_i.class
        puts new_position.to_i.class

        @room_paths_controller.each do |room_path|
            puts room_path.class
            if new_position.to_i == room_path
                puts true
            else
                puts false
            end
        end
    end
end

class Character
    attr_accessor :name, :position

    def initialize name, position, alive = true
        @name = name
        @position = position
        @alive = true
    end
end

class Room
    attr_accessor :number, :paths, :message

    def initialize number, paths, message
        @number = number
        @paths = paths
        @message = message
    end
end

#Characters
main_character = Character.new 'trippy monkey', 1

#Rooms
main_room = Room.new 1, { :W => 2, :E => 3 }, 'You are in the main room, you can enter in room 2 (W) or 3 (E)'
leon_cage = Room.new 2, { :N => 4, :E => 1 }, 'You are in the leon cage'
crazy_wizard_room = Room.new 3, { :S => 5, :W => 1 }, 'You are in the crazy wizard room'
armoury = Room.new 4, { :S => 2 }, 'You are in the armoury'
bom_room = Room.new 5, { :N => 3 }, 'You are in the bom room'

#Starting the game 
monkey_paradise = Game.new main_character
#monkey_paradise = Game.new main_character, 'maniac'

#Adding rooms to the game
monkey_paradise.add_room main_room
monkey_paradise.add_room leon_cage
monkey_paradise.add_room crazy_wizard_room
monkey_paradise.add_room armoury
monkey_paradise.add_room bom_room

#Where the character start
monkey_paradise.show_current_room 1

#Enter a room
monkey_paradise.enter_the_roomf