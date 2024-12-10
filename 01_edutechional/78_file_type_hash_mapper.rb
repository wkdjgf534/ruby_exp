# frozen_string_literal: true

require 'rspec'

# Whether it's a complex coding interview question or algorithm implementation, there are many times where you will
# be asked to combine a large number of processes into a single feature. In this guide we'll examine how to build
# a non-trivial program that takes in an array of file names and generates a hash collection where each file type is
# the key and the value is an array of their respective file names
#
# https://www.youtube.com/watch?v=TWV4HEGLUSY&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=85

file_names = %w[file1.rb file2.html file3.rb file4.rb file5.js]

# Standard Ruby Array class
class Array
  def file_type_mapper
    each_with_object(Hash.new { |h, k| h[k] = [] }) do |file, hash|
      file_ext = File.extname(file)[1..]
      hash[file_ext] << file.chomp(".#{file_ext}")
    end
  end
end

p file_names.file_type_mapper

describe '.file_type_mapper' do
  it 'converts an array of file names into a hash where each file type is the key' do
    expect(file_names.file_type_mapper)
      .to eq({ 'rb' => %w[file1 file3 file4], 'html' => ['file2'], 'js' => ['file5'] })
  end
end
