# frozen_string_literal: true

require 'rspec'

# This Ruby coding exercise walks through how to build out a weighted lottery and utilizes methods such as
# each_with_object, nested iterators, and randomization.
#
# https://www.youtube.com/watch?v=BKF4pTWFLZk&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=96

weights = {
  winning: 1,
  losing: 4
}.freeze

def weighted_lottery(weights)
  weights.each_with_object([]) do |(weight_key, weight_val), container_arr|
    weight_val.times { container_arr << weight_key }
  end.sample
end

p weighted_lottery(weights)

describe 'weighted_lottery' do
  it 'gives a proportionate chance of winning in relation to the weights for two weights' do
    weights = {
      winning: 1,
      losing: 1_000
    }.freeze

    won = 0
    lost = 0

    1_000.times do
      weighted_lottery(weights) == :losing ? lost += 1 : won += 1
    end

    result = (lost > won)
    expect(result).to be_truthy
  end

  it 'gives a proportionate chance of winning in relation to the weights for any number of weights' do
    weights = {
      winning: 1,
      breaking_even: 100,
      losing: 1_000
    }.freeze

    won = 0
    broke_even = 0
    lost = 0

    1_000.times do
      result = weighted_lottery(weights)
      if result == :losing
        lost += 1
      elsif result == :breaking_even
        broke_even += 1
      else
        won += 1
      end
    end

    lost_vs_broke_even = (lost > broke_even)
    broke_even_vs_won = (broke_even > won)

    expect(lost_vs_broke_even).to be_truthy
    expect(broke_even_vs_won).to be_truthy
  end
end
