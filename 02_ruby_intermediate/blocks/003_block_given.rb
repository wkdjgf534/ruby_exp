# frozen_string_literal: true

def custom_logger
  sleep(2)
  puts 'Logging data...'
  sleep(2)
  puts 'More logging data...'
end

def my_block
  puts 'Starting the block'

  yield custom_logger if block_given?

  puts 'Ending the block'
end

my_block { puts "I'm in a block" }
