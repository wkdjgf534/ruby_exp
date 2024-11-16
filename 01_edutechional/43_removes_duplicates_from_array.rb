# frozen_string_literal: true

require 'rspec'

# Learn how to manually remove duplicates from an array in Ruby without using the uniq method.
#
# https://www.youtube.com/watch?v=nvwRUXyvnKU&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=48

arr = [1, 2, 3, 3, 1, 4, 1, 4]

# Standard Ruby Array class
class Array
  # def remove_duplicates = tally.keys

  def remove_duplicates
    each_with_object([]) { |e, arr| arr << e unless arr.include?(e) }
  end
end

p arr.remove_duplicates

describe '.remove_duplicates' do
  it 'removes duplicates form an array' do
    expect(arr.remove_duplicates).to match_array([1, 2, 3, 4])
  end
end
