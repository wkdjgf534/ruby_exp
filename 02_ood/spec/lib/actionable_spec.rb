# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/action'
require_relative '../../lib/hero'
require_relative '../../lib/dicepool'
require_relative '../../lib/monster'

class TestAction
  include Actionable

  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end
end

describe Actionable do
  let(:hero) { instance_double(Hero, strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:action) { TestAction.new(hero) }
  let(:dicepool) { instance_double(Dicepool) }
  let(:monster) { instance_double(Monster, toughness: 2, damage: 4) }

  it_behaves_like 'action'

  describe 'activate' do
    before { Dicepool.stub(:new).and_return(dicepool) }

    it 'sends success message if skill check is successful' do
      dicepool.stub(:skill_check).and_return(true)
      action.stub(:activate).and_return(:success)
      action.activate(monster)
    end

    it 'sends failure message if skill check is not successful' do
      dicepool.stub(:skill_check).and_return(false)
      action.stub(:activate).and_return(:failure)
      action.activate(monster)
    end
  end
end
