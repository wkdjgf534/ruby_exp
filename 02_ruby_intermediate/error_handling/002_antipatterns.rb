# frozen_string_literal: true

def divider(num1, num2)
  num1 / num2
rescue ZeroDivisionError => e
  "An error occured: #{e}"
end

p divider(1, 0)
