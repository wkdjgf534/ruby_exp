# frozen_string_literal: true

require 'rspec'

# In this guide you'll learn how to build a method that returns the potential number of combinations associated with
# building a lock picking method, including both how to count the number of permutations and generating the full set of options.
#
# https://www.youtube.com/watch?v=Uk_u6mI5Qek&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=70

# permutation - https://ruby-doc.org/3.3.6/Array.html#method-i-permutation
def lockpick(arr, combination: false)
  enumerable = arr.permutation(3)
  return enumerable.to_a if combination

  enumerable.size
end

p lockpick([14, 9, 29])
p lockpick([14, 9, 29], combination: true)

describe '#lockpick' do
  it 'tells' do
    values = [14, 9, 29]
    expect(lockpick(values)).to eq(6)
  end

  it 'tells' do
    values = [14, 9, 29, 44, 2, 33]
    expect(lockpick(values)).to eq(120)
  end

  it 'tells' do
    values = [14, 9, 29]
    expect(lockpick(values, combination: true))
      .to match_array([[14, 9, 29], [14, 29, 9], [9, 14, 29], [9, 29, 14], [29, 14, 9], [29, 9, 14]])
  end
end
