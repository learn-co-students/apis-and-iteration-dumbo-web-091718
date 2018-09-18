def welcome
  # puts out a welcome message here!
  "Welcome to Star Wars Encyclopedia"
end

def get_character_from_user
  puts "Please enter a character"
  user_response = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
