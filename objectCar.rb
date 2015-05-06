class Car 
	@@brand = 'seat'
	attr_accessor :noise
	def initialize noise
		@noise = noise
		add_count
	end
	def make_noise
		puts @noise
	end
	def self.view_count #Coge datos de cars.txt, guarda en countCars
		puts IO.read("cars.txt")
	end
	def return_count
		count = IO.read("cars.txt")
	end
	def self.get_count #Método de clase, accede a las variables de clase
		puts "Count of cars #{@@count}"
	end
	def add_count #Guarda en el fichero Cars.txt la variable countCars
		count_cars = return_count.to_i
		count_cars += 1
		IO.write("cars.txt",count_cars)
	end
	def ret_noise
		return @noise
	end
end
class Racing_car < Car #Crea la clase Racing_car, hereda de Car	
		def initialize 
			@noise = 'BROOOOOOOOM!'
		end
end


my_car = Car.new 'broom'
my_car2 = Car.new 'BROOOM'
my_car3 = Car.new 'Broom-Broom-Broomm-Broom'
my_car.make_noise
my_car2.make_noise
Car.view_count
porsche = Racing_car.new
porsche.make_noise
puts "Noise of all cars:"
cars_array = [my_car, my_car2, my_car3]
cars_array.push porsche
cars_array.each {|car| car.make_noise}
#Ejercicio que coge de un Array y crea 3 nuevos objetos a partir de los sonidos incluidos en el array
sounds = ["Broom", "Meek", "Tac tac tac"]
newCars = sounds.map { |sound| new_car = Car.new  sound}
puts "print noise new cars"
newCars.each {|car| car.make_noise}
soundsCars = newCars.reduce("") do |allSounds, x| 
	allSounds + x.noise
end
puts soundsCars

