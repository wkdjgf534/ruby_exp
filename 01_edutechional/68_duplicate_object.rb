# frozen_string_literal: true

require 'rspec'

# In this guide you'll walk through how to leverage symbols in Ruby in order to duplicate objects,
# including how they can share an object_id.
#
# https://www.youtube.com/watch?v=aA1FWuJh-gQ&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=72

str_array = ['some word', 'some word', 'some word']

def duplicate_objects(arr) = arr.map(&:to_sym)

p duplicate_objects(str_array)

describe '#duplicate_objects' do
  it 'clones an string and maintain the same object_id assuming that the string is identical' do
    cloned_array = duplicate_objects(str_array)
    expect(cloned_array.first.object_id).to eq(cloned_array.last.object_id)
  end
end
