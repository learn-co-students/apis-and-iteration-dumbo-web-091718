def welcome
  puts "Hello, hi! Welcome! How's your day? Good? Nice."
end

def get_character_from_user
  puts "Please enter a character:"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  return user_input.downcase
end

def get_movie_from_user
  puts "Please enter a movie title:"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  get_director(user_input.downcase)

end
