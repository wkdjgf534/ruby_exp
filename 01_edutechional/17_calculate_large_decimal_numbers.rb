# frozen_string_literal: true

require 'rspec'
require 'bigdecimal'

# This coding exercise walks through how to accurately multiple large decimals and examines how a potentially
# dangerous bug can slip into a codebase
#
# https://www.youtube.com/watch?v=DJe4xCvmMtg&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=18

number1 = '10.0987345897234093284023'
number2 = '42.0987345897234093284023'

# Ruby has problem with long float numbers, the result of multiplication is 425.14394718482515 (incorrect answer)
def large_number_processor(num1, num2) = (BigDecimal(num1) * BigDecimal(num2)).to_s('F')

p large_number_processor(number1, number2)

describe '#large_number_processor' do
  it 'accurately multiples 2 large numbers' do
    expect(large_number_processor(number1, number2)).to eq('425.14394718482513504388005529072886672947064529')
  end
end
