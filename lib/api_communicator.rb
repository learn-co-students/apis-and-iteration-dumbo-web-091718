require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  counter = 1
  all_info_array = []

  while counter <= 9
    response_string = RestClient.get("http://www.swapi.co/api/people/?page=#{counter}").body
    response_hash = JSON.parse(response_string)
    all_info_array << response_hash
    counter += 1
  end


  films = []

  all_info_array.each do |collection|
    collection["results"].each do |profile|
      if profile["name"].downcase == character
        profile["films"].each do |film|
          films << film
        end
      end
    end
  end

  films_hash = []

  films.each do |film|
    film_string = RestClient.get(film).body
    films_hash << JSON.parse(film_string)
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
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    film_string = RestClient.get(film).body
    full_info_hash = JSON.parse(film_string)
    puts full_info_hash["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)

  puts "May the Force be with You"
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
