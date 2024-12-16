# frozen_string_literal: true

require 'rspec'

# In many cases, lambdas are the most effective when they're used in conjunction with methods.
# A method is limited to taking a single block in Ruby, however by leveraging lambdas you are able to pass
# in as many blocks as needed.
#
# https://www.youtube.com/watch?v=RSPySwvgTgg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=90

location_query = ->(lat, long) { "#{lat}, #{long}" }
time_query = -> { Time.now }

def user_update(name, set_location, pinged_at)
  <<~DATA
    Name: #{name}
    Location: #{set_location}
    Time: #{pinged_at}
  DATA
end

p location_query.call(53.23, 123.32)
p time_query.call
puts user_update('Peter', location_query.call(111, 222), time_query.call)

describe '#user_update' do
  it 'shows that methods can be passed multiple blocks when leveraging lambdas' do
    status = user_update('Tiffany', location_query.call(53.23, -123.32), time_query.call)
    expect(status).to eq("Name: Tiffany\nLocation: 53.23, -123.32\nTime: #{Time.now}\n")
  end
end
