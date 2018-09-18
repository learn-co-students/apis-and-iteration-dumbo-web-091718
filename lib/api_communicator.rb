require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)["results"]

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`


  films_url = []
  response_hash.each do |index|
     if index["name"].downcase == character
       films_url = index["films"]
     end
   end

  # returns array of film urls for given character
film_data  = {}

  films_url.map do|url|
   film_data = RestClient.get(url)
     puts film_data   # returns k, v hash as: {title: ., description: ..., director":"Irvin ..","producer":"Gary}
     puts " "
  end

  # films.each do |film_url|
  #     puts film_url
  #     puts film_url.class


  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

# cleaned_films = [{"movie title": something,  "description" : something}
#   {"nhjjkjkk "} , {}]

puts get_character_movies_from_api("luke skywalker")

def print_movies(films_hash)
  # puts # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
