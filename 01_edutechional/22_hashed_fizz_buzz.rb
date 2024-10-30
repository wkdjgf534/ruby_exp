# frozen_string_literal: true

require 'rspec'

# This coding exercise tests your knowledge of the popular FizzBuzz developer interview question, with a twist.
# In this version of FizzBuzz you'll build a hash data structure filled with FizzBuzz data.
#
# https://www.youtube.com/watch?v=mJN52woJwzw&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=23

def hashed_fizz_buzz(number)
  hash = {}
  (1..number).each do |num|
    string = ''
    string += 'Fizz' if (num % 3).zero?
    string += 'Buzz' if (num % 5).zero?
    hash[num] = string.empty? ? num : string
  end
  hash
end

p hashed_fizz_buzz(25)

describe '#hashed_fizz_buzz' do
  it 'generates a fizz buzz hash' do
    expect(hashed_fizz_buzz(25)).to include(1 => 1, 5 => 'Buzz', 9 => 'Fizz', 15 => 'FizzBuzz', 25 => 'Buzz')
  end
end
