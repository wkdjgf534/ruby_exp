# frozen_string_literal: true

require 'rspec'

# In this coding exercise you'll learn how to automatically retry a failed process in a Ruby program.
#
# https://www.youtube.com/watch?v=jnerdArQT0Q&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=41

# ApiConnector class
class ApiConnector
  attr_accessor :attempts, :errors

  def initialize
    @attempts = 0
    @errors = []
  end

  def send_data
    @attempts += 1
    api_call
  rescue Errno::ETIMEDOUT => e
    @errors << e
    retry if @attempts < 3
  end

  def api_call
    raise Errno::ETIMEDOUT
  end
end

api = ApiConnector.new
api.send_data
p api.attempts
p api.errors

describe 'ApiConnector' do
  it 'attempts to connect with an API 3 times and stores the errors in an array' do
    api = ApiConnector.new
    api.send_data
    expect(api.attempts).to eq(3)
    expect(api.errors.to_s).to include('#<Errno::ETIMEDOUT')
  end
end
