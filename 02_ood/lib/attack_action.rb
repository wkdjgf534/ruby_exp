# frozen_string_literal: true

require_relative 'action'

class AttackAction < Action
  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end

  def success(target)
    target.kill!
    owner.gain_exp(3)
    owner.gain_gold(3)
  end

  def failure(target) = owner.damage(target.damage)
end
