require 'rest-client'
require 'json'
require 'pry'

def get_hash(url)
  response_string = RestClient.get(url)
  return response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character)
  #make the web request
  films_array =[]
  response_hash = get_hash('http://www.swapi.co/api/people/')
  array = [response_hash]
  while array[-1]["next"] != nil
    array << get_hash(response_hash["next"])
    response_hash = get_hash(response_hash["next"])
    #binding.pry
  end

  #binding.pry
 array.each do |hash_hash|
    hash_hash["results"].each do |person|
  	   if person['name'].downcase == character
        	person['films'].each do |url|
            film_hash = get_hash(url)
  	        films_array << film_hash
  	       end
  	   end
   end
 end
films_array
end

#get_character_movies_from_api("Luke Skywalker")

def get_director(film_name)
  films_hash = get_hash('https://swapi.co/api/films')
  films_hash["results"].each do |film|
      if film["title"].downcase == film_name
        puts "#{film["title"]}'s Director: #{film["director"]}"
      end
  end
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    puts "Title: #{film["title"]}"
    puts "Episode: #{film["episode_id"]}"
    puts "Director: #{film["director"]}"
    puts "Released: #{film["release_date"]}"
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

#show_character_movies("Luke Skywalker")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
