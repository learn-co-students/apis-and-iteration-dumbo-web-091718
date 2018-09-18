require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

films_array = []
  response_hash["results"].each do |person|
    if person["name"].downcase == character.downcase
         person["films"].collect do |url|
          info_string = RestClient.get(url)
          info_hash = JSON.parse(info_string)
          films_array << info_hash
        end
      end
    end
films_array
end
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.



  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def parse_character_movies(character)

end

def print_movies(films_hash)

films_hash.each_with_index do |movie, idx|

 puts "#{idx + 1}. #{movie["title"]}"


end

end

# print_movies(films_hash)

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
