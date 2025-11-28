# frozen_string_literal: true

begin
  p 1 / 0
rescue StandardError
  p 'An error occured'
end
