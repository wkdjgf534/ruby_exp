# frozen_string_literal: true

require 'rspec'

# In this coding exercise we'll build out an extensive tip calculator that can accept integers, string based numbers
# and even words to dynamically generate a tip.
#
# https://www.youtube.com/watch?v=qFJBDda8NW4&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=33

module Tippy
  class Builder
    attr_reader :total, :gratuity

    TIP_RATES = { high: 25.0, standard: 18.0, low: 15.0 }.freeze

    def initialize(total:, gratuity:)
      @total = total
      @gratuity = gratuity
    end

    def generate = total + tip

    private

    def number_based_tips? = gratuity.is_a?(Numeric) || gratuity.to_f.positive?

    def tip
      tip_percent = number_based_tips? ? (gratuity.to_f / 100) : (TIP_RATES[gratuity.downcase.to_sym] / 100)

      total * tip_percent
    end
  end
end

tip = Tippy::Builder.new(total: 100, gratuity: 23.5)
p tip.generate

describe 'Tip generator' do
  describe '#generate' do
    it 'Accurately generates a tip given string or integer input' do
      tip1 = Tippy::Builder.new(total: 100, gratuity: '23.5').generate
      tip2 = Tippy::Builder.new(total: 100, gratuity: 'high').generate
      tip3 = Tippy::Builder.new(total: 100, gratuity: 'LOW').generate
      tip4 = Tippy::Builder.new(total: 100, gratuity: 'standard').generate
      tip5 = Tippy::Builder.new(total: 100, gratuity: '18').generate
      tip6 = Tippy::Builder.new(total: 100, gratuity: 20).generate
      tip7 = Tippy::Builder.new(total: 100, gratuity: 0).generate

      expect(tip1).to eq(123.5)
      expect(tip2).to eq(125.0)
      expect(tip3).to eq(115.0)
      expect(tip4).to eq(118.0)
      expect(tip5).to eq(118.0)
      expect(tip6).to eq(120.0)
      expect(tip7).to eq(100.0)
    end
  end
end
