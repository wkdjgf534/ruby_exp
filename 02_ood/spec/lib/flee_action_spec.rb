# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/flee_action'
require_relative '../../lib/hero'
require_relative '../../lib/dicepool'
require_relative '../../lib/monster'

describe FleeAction do
  let(:hero) { instance_double(Hero, strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 3) }
  let(:action) { described_class.new(hero) }
  let(:dicepool) { instance_double(Dicepool) }
  let(:monster) { instance_double(Monster, toughness: 2, damage: 4, notice: 2) }

  it_behaves_like 'actionable'
  it_behaves_like 'action'

  it 'has stealth for attribute' do
    expect(action.attribute).to eq(:stealth)
  end

  it 'has notice for difficulty' do
    expect(action.difficulty).to eq(:notice)
  end

  describe 'effect' do
    before { Dicepool.stub(:new).and_return(dicepool) }

    context 'when success' do
      it 'sends flee message to the owner' do
        dicepool.stub(:skill_check).and_return(true)
        hero.should_receive(:flee)
        action.activate(monster)
      end
    end

    context 'when failure' do
      it 'deals damage to the owner' do
        dicepool.stub(:skill_check).and_return(false)
        hero.should_receive(:damage).with(monster.damage)
        action.activate(monster)
      end
    end
  end
end
