# frozen_string_literal: true

require 'rspec'

# This guide walks through how to implement a progress tracking class in Ruby that can update a user's progress
# and dynamically update the overall percent completed.
#
# https://www.youtube.com/watch?v=3s6HMcp46mU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=74

class Completion
  def initialize(number_of_guides:, total_completed:)
    @number_of_guides = number_of_guides
    @total_completed = total_completed
  end

  def completed_percentage = @total_completed.to_f / @number_of_guides

  def mark_compelte
    @total_completed += 1
  end
end

c = Completion.new(number_of_guides: 100, total_completed: 55)
p c.completed_percentage
c.mark_compelte
p c.completed_percentage

describe 'Course tracker' do
  it 'tracks course progress' do
    c = Completion.new(number_of_guides: 100, total_completed: 55)
    expect(c.completed_percentage).to eq(0.55)

    c.mark_compelte

    expect(c.completed_percentage).to eq(0.56)
  end
end
