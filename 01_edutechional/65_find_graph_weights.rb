# frozen_string_literal: true

require 'rspec'

# This guide walks through how to work with a mapping application and apply graph traversal techniques to find
# the distance for each weight in a graph.
#
# https://www.youtube.com/watch?v=XCr4tjbsx5g&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=69

nodes = [[1, 3], [2, 3], [3, 4]]

def route_generator(route_total, nodes)
  route_total.to_f / nodes.inject(0) { |total, node| total + node.last }
end

p route_generator(15, nodes)

describe '#route_generator' do
  it 'calculates the value of weight in a mapping application' do
    expect(route_generator(15, nodes)).to eq(1.5)
  end
end
