# frozen_string_literal: true

require 'rspec'

# Rock, paper, scissors may seem like a simple game to build, however it offers a great base case for how to build
# a rule's engine that can be scaled up for more complex systems. In this guide we'll examine how to build the game
# so that users can play against the computer.
#
# https://www.youtube.com/watch?v=ovwjH64ZGOs&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=93

class RPS
  RAND_NUMBER = 102_030

  attr_writer :rand_seed

  def initialize(guess:)
    @guess = guess.downcase
  end

  def randomization_algorithm = rand(RAND_NUMBER)

  def computer_guess
    srand(@rand_seed || randomization_algorithm)
    %w[rock paper scissors].sample
  end

  def winner_is
    return 'Computer wins' if rule_engine[computer_guess.to_sym].include?(@guess)
    return 'You win!' if rule_engine[@guess.to_sym].include?(computer_guess)

    'Tie'
  end

  def rule_engine = { rock: 'scissors', paper: 'rock', scissors: 'paper' }
end

rps = RPS.new(guess: 'Rock')

p rps.winner_is

# Note: Seeding the randomizer so the computer will always pick paper for testing
describe RPS do
  it 'paper beats rock' do
    rps = RPS.new(guess: 'rock')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Computer wins')
  end

  it 'paper loses to scissors' do
    rps = RPS.new(guess: 'Scissors')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('You win!')
  end

  it 'paper ties with paper' do
    rps = RPS.new(guess: 'paper')
    rps.rand_seed = 1
    expect(rps.winner_is).to eq('Tie')
  end
end
