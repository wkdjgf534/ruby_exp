# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/hero'
require_relative '../lib/dicepool'
require_relative '../lib/monster'

describe Hero do
  let(:dicepool) { instance_double(Dicepool) }

  describe 'default attributes' do
    let(:hero) { described_class.new(dicepool: dicepool) }

    it 'has default strength equal to 3' do
      expect(hero.strength).to eq(3)
    end

    it 'has default health equal to 10' do
      expect(hero.health).to eq(10)
    end

    it 'can be initialized with custom strength' do
      hero = described_class.new(strength: 3, dicepool: dicepool)
      expect(hero.strength).to eq(3)
    end

    it 'can be initialized with custom health' do
      hero = described_class.new(health: 8, dicepool: dicepool)
      expect(hero.health).to eq(8)
    end
  end

  describe 'attack action' do
    it 'succesds' do
      dicepool.stub(:skill_check).and_return(true)
      hero = described_class.new(dicepool: dicepool)
      monster = instance_double(Monster, toughness: 2)

      expect(hero.attack(monster)).to be_truthy
    end

    it 'fails' do
      dicepool.stub(:skill_check).and_return(false)
      hero = described_class.new(dicepool: dicepool)
      monster = instance_double(Monster, toughness: 2)

      expect(hero.attack(monster)).to be_falsey
    end
  end
end
