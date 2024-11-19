# frozen_string_literal: true

require 'rspec'

# This guide examines the process needed for building a sorting mechanism that ignores preceding values such
# as bullet points.
#
# https://www.youtube.com/watch?v=AyjLGYprsM0&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=51

def state_sorter(states) = states.sort_by { state[-2, 2] }

states = ['- AZ', 'KY', '* FL', '-- AR']
p state_sorter(states)

describe '#state_sorter' do
  it 'proprtly sorts an array of states' do
    expect(state_sorter(states).first).to eq('-- AR')
    expect(state_sorter(states).last).to eq('KY')
  end
end
