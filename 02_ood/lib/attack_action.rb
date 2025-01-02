# frozen_string_literal: true

class AttackAction
  attr_reader :owner, :dicepool

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool = dicepool
  end

  def activate(target)
    dicepool.skill_check(owner.strength, target.toughness) ? success(target) : failure(target)
  end

  def success(target)
    target.kill
    owner.gain_exp(3)
    owner.gain_gold(3)
  end

  def failure(target) = owner.damage(target.damage)
end
