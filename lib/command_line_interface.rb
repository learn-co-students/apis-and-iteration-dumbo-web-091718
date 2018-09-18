def welcome
puts "Welcome to the space!"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  character.downcase
end
