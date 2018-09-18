require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
  films = []
  response_hash["results"].each do |person|
      if person["name"].downcase == character
          films = person["films"]

      end #if
  end # do
  film_api =[]
  films.each do |film|
    response_string = RestClient.get(film)
  film_api << response_string
end
film_description = []
  film_api.each do |film_info|
      film_hash = {}
      response_hash = JSON.parse(film_info)
    film_hash["title"] = response_hash["title"]
    film_description << film_hash

  end
    
    return film_description
#       if character_found == false
#         while character_found == false
#           response_string = RestClient.get('http://www.swapi.co/api/people/?page=#{counter}')
#           response_hash = JSON.parse(response_string)
#           response_hash["results"].each do |person|
#               if person["name"].downcase == character
#                   films = person["films"]
#                   get_info(films)
#                   character_found = true
#               end #if
#           counter += 1
#       end #do
#     end #while
# end #if



end #do

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

# def get_info(films)
#
#       film_api =[]
#       films.each do |film|
#         response_string = RestClient.get(film)
#       film_api << response_string
#     end
#     film_description = []
#       get_info(films).each do |film_info|
#           film_hash = {}
#           response_hash = JSON.parse(film_info)
#         film_hash["title"] = response_hash["title"]
#         film_description << film_hash
#       end
# end



def print_movies(films_hash)
  films_hash.each do |movie|
    puts movie["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
