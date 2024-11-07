# frozen_string_literal: true

require 'rspec'

# In this Ruby coding exercise your knowledge of blocks will be tested. The requirement is to build a User class that
# can be created and passed a block to set its values in addition to the traditional process for setting an object's data
#
# https://www.youtube.com/watch?v=WtMCdRLrt6E&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=34

# Class User
class User
  attr_accessor :name, :email

  def initialize = yield(self) if block_given?
end

user = User.new do |u|
  u.name = 'Jordan'
  u.email = 'test@test.com'
end

p user.inspect

describe 'User' do
  it 'allows a user to be created with block of values' do
    user = User.new do |u|
      u.name = 'Jordan'
      u.email = 'test@test.com'
    end

    expect(user.name).to eq('Jordan')
    expect(user.email).to eq('test@test.com')
  end

  it 'allows a user to be created without default values' do
    user = User.new
    user.name = 'Jordan'
    user.email = 'test@test.com'

    expect(user.name).to eq('Jordan')
    expect(user.email).to eq('test@test.com')
  end
end
