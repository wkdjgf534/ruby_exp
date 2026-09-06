# frozen_string_literal: true

print 'Enter a genre:'
genre = gets.chomp

result = case genre
         when 'fiction'
           10
         when 'biography'
           15
         when 'engineering'
           25
         else
           'No results found'
         end

puts "Your query returned: #{result}"
