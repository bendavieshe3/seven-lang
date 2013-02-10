# Day 1 bonus
# Write a program that picks a random number, lets the player guess what 
# it is and tell the player whether they are lower or higher than the guess


chosen_number = rand(10) + 1
guess = nil
tries = 5
while guess.to_i != chosen_number and tries > 0
  unless guess.nil?
    puts 'Your guess was too ' + (guess.to_i < chosen_number ? 'low.' : 'high.')
    puts "You have #{tries} #{tries == 1 ? 'attempts' : 'attempt'} remaining. Try again." 
  end
  print 'Guess what number I have chosen > '
  guess = gets.chomp.downcase
  tries -= 1  
end
if guess == chosen_number
  puts "Thats right! I had chosen #{chosen_number}. Thankyou for playing!"
else 
  puts "Sorry, you ran out of tries. I had chosen #{chosen_number}. Better luck next time!"
end
