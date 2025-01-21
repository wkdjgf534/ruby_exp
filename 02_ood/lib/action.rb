# frozen_string_literal: true

class Action
  attr_reader :owner, :dicepool, :attribute, :difficulty

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool = dicepool

    action_attributes
  end

  def action_attributes
    raise 'You must initialize @attriubte and @difficulty'
  end

  def activate(target)
    dicepool.skill_check(owner.send(attribute), target.send(difficulty)) ? success(target) : failure(target)
  end

  def success; end

  def failure; end
end
