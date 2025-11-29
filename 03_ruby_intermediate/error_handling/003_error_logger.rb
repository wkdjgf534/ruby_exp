# frozen_string_literal: true

module MyLogger
  def self.save_log(err)
    File.open('server_logs.txt', 'a') do |f|
      f.puts "Error: #{err} occured at: #{Time.new}"
      puts 'Error logged'
    end
  end
end

5.times do |i|
  sleep(1)
  i.pop
rescue StandardError => e
  MyLogger.save_log(e)
end
