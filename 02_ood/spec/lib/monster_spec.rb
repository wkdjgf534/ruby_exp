# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/monster'

describe Monster do
  let(:monster) { described_class.new(toughness: 2, damage: 4, notice: 1, gold: 10, exp: 20) }

  it 'has toughness' do
    expect(monster.toughness).to eq(2)
  end

  it 'has damage' do
    expect(monster.damage).to eq(4)
  end

  it 'has notice' do
    expect(monster.notice).to eq(1)
  end

  it 'has gold' do
    expect(monster.gold).to eq(10)
  end

  it 'has exp' do
    expect(monster.exp).to eq(20)
  end

  it 'is alive on initialization' do
    expect(monster).not_to be_dead
  end

  it 'can be killed' do
    monster.kill!
    expect(monster).to be_dead
  end
end
