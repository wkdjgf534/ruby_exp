# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/dicepool'

describe Dicepool do
  describe 'skill_check' do
    it 'returns true if number of successes is more than difficulty' do
      dicepool = described_class.new
      dicepool.stub(:roll_die).and_return(5)

      expect(dicepool.skill_check(3, 2)).to be_truthy
    end

    it 'returns false if number is less than diffuculty' do
      dicepool = described_class.new
      dicepool.stub(:roll_die).and_return(2)

      expect(dicepool.skill_check(3, 2)).to be_falsey
    end
  end
end
