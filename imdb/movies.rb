require 'imdb'
require 'pry'
require 'ascii_charts'
class Search_imdb
	@@list_rating = []
#En el constructor, pasamos por param, un string con el nom de la peli a buscar,
#lo introducimos por parámetro al método searc_movies, lo asignamos a la variable d instancia
#@my_movie
	def initialize nom_peli 
		@my_movie = Imdb::Movie.new(search_movies(nom_peli))
		save_text_list
		@@list_rating.push(@my_movie.rating.round)
		@data_chart = []

	end
#Entra un string con el nombre de la película, hacemos la búsqueda con este nombre, asignamos a pelis, devuelve un array
#utilizamos el método .movies, el primer valor del array, id. con esto ya tendremos el ID de la peli para
#en el constructor asignar el objeto a la variable @my_movie
	def search_movies nom_peli
		pelis = []
		pelis = Imdb::Search.new(nom_peli)
		pelis.movies[0].id
	end
	def show_title
		puts @my_movie.title
		puts @my_movie.rating
	end
	def save_text_list
		text_saved = IO.read("movie_rating.txt")
		complete_text = text_saved << "\n" << "- " << @my_movie.title 
		IO.write("movie_rating.txt",complete_text)
	end
	def draw_graphic
		i=0
		@@list_rating.each do |num|
			i += 1
			@data_chart << [i, num]
		end
		puts AsciiCharts::Cartesian.new(@data_chart, :bar => true, :hide_zero => true).draw
	end
	def show_list_rating
		puts @@list_rating
	end

end
 IO.write("movie_rating.txt"," ")
film1 = Search_imdb.new "Die Hard"
film2 = Search_imdb.new "Ghostbusters"
film3 = Search_imdb.new "The Godfather"
film4 = Search_imdb.new "Home alone"
film5 = Search_imdb.new "Star trek, the new generation"
film6 = Search_imdb.new "The night of the living dead"
film7 = Search_imdb.new "Titanic"

film1.show_title
film2.show_title
film3.show_title
film4.show_title
film5.show_title
film6.show_title
film7.show_title
film1.draw_graphic


