require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #this url makes web request for the main page
  response_string = RestClient.get("http://www.swapi.co/api/people/").body
  main_hash = JSON.parse(response_string)

  films_hash = []
  main_hash["results"].collect do |char_hash|
  # binding.pry
    if character == char_hash["name"].downcase
    films_hash = char_hash["films"].map do |film|
        film_detail = RestClient.get(film).body
        parsed_film_detail = JSON.parse(film_detail)
      end
    end
    # binding.pry
  end
  films_hash
end
# binding.pry

def print_movies(films_hash)
      # Show a nice list
    films_hash.each.with_index(1) do |film, index|
    puts " \n #{index}. #{film["title"]}"
    # puts "     #{index}. #{film["title"]}: \n  \n #{film["opening_crawl"]} \n \n \n"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  #Output our nice list
  print_movies(films_hash)
end


#REFACTOR Search For NEXT PAGE && add to method 1




#    def search_eng(character)
#      mainPage_parsedCharacters = JSON.parse(RestClient.get('http://www.swapi.co/api/people/')) #Get and parse at once with ResClient
#       mainPage_Characters = mainPage_parsedCharacters["results"]
#            next_pg = mainPage_parsedCharacters["next"]
#
#             nxt_p = JSON.parse(RestClient.get(next_pg))
#             nxt = nxt_p["results"]
#
#             nxt.each do |i| char_hash = i  # puts char_hash.class
#               char_hash.map do |k, v|
#                 film_arr = {}
#                 if v == character
#                  char_hash.fetch('films').map do |film|
#                     return film_arr =  JSON.parse(RestClient.get(film))
#                     # binding.pry
#                  end # if
#                  # return cleaned_films
#                end # do film
#                  # return cleaned_films
#                end # do character
#
#            end
#               # return cleaned_films
#            end
#       # p search_eng("Palpatine")
#
#            #   ***************************
#
#   #          np = JSON.parse(RestClient.get(next_pg))
#   #          next_thing = np["results"]
#   #           next_thing.each do |element|
#   #             p element
#   #
#   #             b = []
#   #
#   #                        if element["name"] == character
#   #
#   #             #
#   #                       films =  element.fetch('films')
#   #                       films.each do |film|
#   #
#   # binding.pry
#   #                             # clean_films = JSON.parse(RestClient.get(film))
#   #                             b << JSON.parse(RestClient.get(film))
#   #
#   #                           end # do
#   #                         end  #if
#   #                           binding.pry
#   #                         return b
#   #
#   #                       end   #do
#
#        #     ******************************
#             # Can just iterate through parsed with each
#   #     mainPage_Characters.each do |element|
#   #
#   #         #, episode_id: 'episode_id',
#   # #opening_crawl: "opening_crawl"
#   #
#   # a = []
#   #            if element["name"] == character
#   #            clean_films = element.fetch('films').each do |film|
#   #                 # clean_films = JSON.parse(RestClient.get(film))
#   #                 a << JSON.parse(RestClient.get(film))
#   #
#   #               end # do
#   #
#   #              a[0].each do |k,v|
#   #
#   #
#   #                if  k[v] != 'title'  && k[v] != 'opening_crawl'
#   #                clean_films = { 'title' => [], }
#   #                clean_films['title'] ||= [i]
#   #                 clean_films['title'] << v
#   #                 clean_films
#   #
#   #                 # clean_films['episode_id'] ||= [v]
#   #                 #  clean_films['episode_id'] << v[v.to_i]
#   #
#   #
#   #                  clean_films['opening_crawl'] ||= [v]
#   #                  clean_films['opening_crawl'] << v
#   #
#   #
#   #             return clean_films
#   #
#   #           end
#   #
#   #           # return a
#   #
#   #         end # end of if
#   #       else
#   #           next_page
#   #           p next_page
#   #
#   #       end
#   #     end
#
#   #  end
#   # p search("Palpatine")
#   # #
#
#   #          ****************************
#
#   def get_character_movies_from_api(character)
#   # all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   # p character_hash = JSON.parse(all_characters)
#
#    mainPage_parsedCharacters = JSON.parse(RestClient.get('http://www.swapi.co/api/people/')) #Get and parse at once with ResClient
#     mainPage_Characters = mainPage_parsedCharacters["results"] # Can just iterate through parsed with each
#
#      parsed_film = []
#
#      mainPage_Characters.each do |element| #element => each characters hash
#        #now find the characters 'films'
#       element["name"] == character # || use element.fetch("films") returns =>["https://films 1, https://..film2, etc"]
#
#              # element.fetch('name') # just to confirm it returns the right char
#              # element.fetch("hair_color") # just to confirm it returns the right char
#         char_urls = element.fetch('films').each do |film|
#            parsed_film << JSON.parse(RestClient.get(film))
#           if element["name"] == character # || use element.fetch("films") returns =>["https://films 1, https://..film2, etc"
#                  return parsed_film
#
#         # film200ok = RestClient.get(film) # => RestClient::Response 200 "{\"title\":\"A...">
#         # # prased_film = JSON.parse(film200ok)
#         # parsed_film = JSON.parse(RestClient.get(film))
#         #
#         # parsed_film # => "title"=>"Attack of the Clones","episode_id"=>2,openin_crawl"=>"There is unrest in th
#           # p film200ok
#       # binding.pry
#     else element["name"] != character
#             search_eng(character)
#
#         end #if
#       end
#       end # do
#
#     end # do
#
#  # puts   get_character_movies_from_api(character)
#
# def print_movies(films_hash)
#
#   # puts # some iteration magic and puts out the movies in a nice list
# end
# #
# def show_character_movies(character)
#   films_array = get_character_movies_from_api(character)
#   print_movies(films_array)
# end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
