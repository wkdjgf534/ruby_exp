# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/attack_action'
require_relative '../../lib/hero'
require_relative '../../lib/dicepool'
require_relative '../../lib/monster'

describe AttackAction do
  let(:hero) { instance_double(Hero, strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:action) { described_class.new(hero, dicepool) }
  let(:dicepool) { instance_double(Dicepool) }
  let(:monster) { instance_double(Monster, toughness: 2, kill: nil, damage: 4) }

  describe 'effect' do
    context 'when success' do
      before { dicepool.stub(:skill_check).and_return(true) }

      it 'kills monster' do
        monster.should_receive(:kill)
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

  describe 'activate' do
    it 'make strength check agains target toughness' do
      dicepool.should_receive(:skill_check).with(hero.strength, monster.toughness)
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
