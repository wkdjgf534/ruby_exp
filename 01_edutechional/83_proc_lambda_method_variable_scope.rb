# frozen_string_literal: true

require 'rspec'

# There are some key differences between procs / lambdas and traditional methods in Ruby,
# however the differences can many times be subtle. In this exercise we'll examine how variable scope is processed differently between the different options.
#
# https://www.youtube.com/watch?v=gvd87pfHU7c&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=89

val = 0

proc_process = -> { val += 1 }

def some_method = val += 1

# p some_method

describe 'proc/lambda vs method' do
  it 'can access a variable outside its scope and process it' do
    proc_process.call
    proc_process.call
    proc_process.call
    expect(proc_process.call).to eq(4)
  end

  it 'will raise an error when trying to access a local variable outside its scope' do
    expect { some_method }.to raise_error(NoMethodError)
  end
end
