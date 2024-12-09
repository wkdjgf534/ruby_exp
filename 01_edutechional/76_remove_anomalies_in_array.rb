# frozen_string_literal: true

require 'rspec'

# When working with large data sets, you'll discover that there are many times where your collections have anomalies
# that need to be removed. In this guide we'll walk through how to easily remove any values lower or higher than a range of values.
#
# https://www.youtube.com/watch?v=GhwQbdHRl9Q&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=82

amount = [44, 8043, 443, 43_452, 2183]

# Standard Ruby Array class
class Array
  def remove_anomalies(min, max) = reject { |e| e < min }.reject { |e| e > max }
end

p amount.remove_anomalies(100, 10_000)

describe '.remove_anomalies' do
  it 'removes all values above and below specified values' do
    expect(amount.remove_anomalies(100, 10_000)).to eq([8043, 443, 2183])
  end
end
