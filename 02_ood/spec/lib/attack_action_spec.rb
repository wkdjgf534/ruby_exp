# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/attack_action'
require_relative '../../lib/hero'
require_relative '../../lib/dicepool'
require_relative '../../lib/monster'

describe AttackAction do
  let(:hero) { instance_double(Hero, strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:action) { described_class.new(hero) }
  let(:dicepool) { instance_double(Dicepool) }
  let(:monster) { instance_double(Monster, toughness: 2, damage: 4) }

  it_behaves_like 'actionable'
  it_behaves_like 'action'

  it 'has strength attribute' do
    expect(action.attribute).to eq(:strength)
  end

  it 'has toughness for difficulty' do
    expect(action.difficulty).to eq(:toughness)
  end

  describe 'effect' do
    before { Dicepool.stub(:new).and_return(dicepool) }

    context 'when success' do
      before do
        dicepool.stub(:skill_check).and_return(true)
        monster.should_receive(:kill!)
      end

      it 'kills monster' do
        action.activate(monster)
      end

      it 'rewards owner with exp' do
        hero.should_receive(:gain_exp)
        action.activate(monster)
      end

      it 'rewards owner with gold' do
        hero.should_receive(:gain_gold)
        action.activate(monster)
      end
    end

    context 'when failure' do
      it 'damages owner' do
        dicepool.stub(:skill_check).and_return(false)
        hero.should_receive(:damage).with(monster.damage)
        action.activate(monster)
      end
    end
  end
end
