# frozen_string_literal: true

def method_one
  proc { return 'String from proc' }.call
  'String froom method one'
end

def method_two
  -> { 'String from Lambda' }.call
  'String from method two'
end

p method_one # 'String from proc'
p method_two # 'String from method two'
