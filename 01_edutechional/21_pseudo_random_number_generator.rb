# frozen_string_literal: true

require 'rspec'

# In this coding exercise you'll learn how to build a pseudo random number generator in Ruby that dynamically creates
# a set of random numbers based on a pre-defined sequence.
#
# https://www.youtube.com/watch?v=UR7N-i3FJtM&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=22

# srand - https://docs.ruby-lang.org/en/master/Kernel.html#method-i-srand
# Fiber - https://docs.ruby-lang.org/en/master/Fiber.html
# resume - https://docs.ruby-lang.org/en/master/Fiber.html#method-i-resume
def pseudo_random_generator(number)
  srand 1

  Fiber.new do
    number.times { Fiber.yield(rand(100)) }
  end
end

nums = pseudo_random_generator(3)
p nums.resume
p nums.resume
p nums.resume

describe '#pseudo_random_generator' do
  it 'creates the same sequence of random numbers' do
    random_sequence = pseudo_random_generator(3)
    expect(random_sequence.resume).to eq(37)
    expect(random_sequence.resume).to eq(12)
    expect(random_sequence.resume).to eq(72)
  end
end
