# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/hero'
require_relative '../lib/dicepool'
require_relative '../lib/monster'

describe Hero do
  describe 'default attributes' do
    let(:hero) { described_class.new }

    it 'has default strength equal to 3' do
      expect(hero.strength).to eq(3)
    end

    it 'has default health equal to 10' do
      expect(hero.health).to eq(10)
    end

    it 'can be initialized with custom strength' do
      hero = described_class.new(strength: 3)
      expect(hero.strength).to eq(3)
    end

    it 'can be initialized with custom health' do
      hero = described_class.new(health: 8)
      expect(hero.health).to eq(8)
    end
  end

  describe 'attack attack' do
    let(:attack_action) { instance_double('attack_action') }
    let(:hero) { described_class.new(actions: { attack: attack_action }) }

    it 'has an attack action' do
      expect(hero.actions[:attack]).to eq(attack_action)
    end

    it 'activates an attact action' do
      monster = instance_double(Monster)
      attack_action.should_receive(:activate)

      hero.activate_action(:attack, monster)
    end
  end
end
