# frozen_string_literal: true

File.open('file_1.txt', 'w+') { |f| f.puts 'Some.text' }

File.open('file_2.txt', 'w+') do |f|
  f.puts 'Some.text'
  f.puts 'Some more text'
  f.puts 'Something else'
end

new_file = File.open('file_3.txt', 'w+')
new_file.puts('Contrent 1')
new_file.puts('Contrent 2')
new_file.puts('Contrent 3')
new_file.close
