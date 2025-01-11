# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/flee_action'
require_relative '../../lib/hero'
require_relative '../../lib/dicepool'
require_relative '../../lib/monster'

describe FleeAction do
  let(:hero) { instance_double(Hero, strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 3) }
  let(:action) { described_class.new(hero, dicepool) }
  let(:dicepool) { instance_double(Dicepool) }
  let(:monster) { instance_double(Monster, toughness: 2, damage: 4, notice: 2) }

  describe 'effect' do
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

  describe 'activate' do
    it 'makes stealth check against target notice' do
      dicepool.should_receive(:skill_check).with(hero.stealth, monster.notice)
      action.activate(monster)
    end
  end

  it 'response to activate message' do
    expect(action).to respond_to(:activate)
  end

  it 'has an owner' do
    expect(action.owner).to eq(hero)
  end
end
