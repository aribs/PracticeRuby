class Car 
	@@brand = 'seat'

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
end
class Racing_car < Car #Crea la clase Racing_car, hereda de Car	
		def initialize 
			@noise = 'BROOOOOOOOM!'
		end
end


my_car = Car.new 'broom'
my_car2 = Car.new 'BROOOM'
my_car.make_noise
my_car2.make_noise
Car.view_count
porsche = Racing_car.new
porsche.make_noise

