# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/hero'
require_relative '../../lib/monster'
require_relative '../../lib/attack_action'

describe Hero do
  let(:hero) { described_class.new }

  describe 'default attributes' do
    it 'has default strength equal to 3' do
      expect(hero.strength).to eq(3)
    end

    it 'has default health equal to 10' do
      expect(hero.health).to eq(10)
    end

    it 'has default stealth equal to 1' do
      expect(hero.stealth).to eq(1)
    end

    it 'has default gold equal to 0' do
      expect(hero.gold).to eq(0)
    end

    it 'has default exp equal to 0' do
      expect(hero.exp).to eq(0)
    end
  end

  it 'can be initialized with custom strength' do
    hero = described_class.new(strength: 3)
    expect(hero.strength).to eq(3)
  end

  it 'can be initialized with custom health' do
    hero = described_class.new(health: 8)
    expect(hero.health).to eq(8)
  end

  it 'can be damaged' do
    hero.damage(3)
    hero.damage(2)

    expect(hero.health).to eq(5)
  end

  it 'gains gold' do
    hero.gain_gold(10)
    hero.gain_gold(5)

    expect(hero.gold).to eq(15)
  end

  it 'gains exp' do
    hero.gain_exp(2)
    hero.gain_exp(5)

    expect(hero.exp).to eq(7)
  end

  describe 'flee state' do
    it 'does not flee by default' do
      expect(hero).not_to be_fled
    end

    it 'flees from battle' do
      hero.flee
      expect(hero).to be_fled
    end
  end

  describe 'attack state' do
    let(:attack_action) { instance_double(AttackAction) }
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
