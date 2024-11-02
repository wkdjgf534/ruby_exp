# frozen_string_literal: true

require 'rspec'

# This Ruby coding problem tests your ability to implement conditionals, work with user input,
# and generate random numbers.
#
# https://www.youtube.com/watch?v=d8acxpnidOo&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=28

def game
  number = rand(25)
  puts 'Guess a number between 0 and 24'

  loop do
    print 'Enter a number:'
    user_answer = gets.chomp.to_i
    if user_answer.negative?
      puts 'It must be a number in a range between 0 and 24, please try again'
      next
    end

    if user_answer == number
      puts 'Yay, you got it right!'
      break
    end
    puts 'You guessed too low, try guessing higher - please guess again' if user_answer < number
    puts 'You guessed too high, try guessing lower - please guess again' if user_answer > number
  end
end

game
