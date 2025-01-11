# frozen_string_literal: true

class Hero
  attr_reader :strength, :health, :actions, :gold, :exp, :stealth

  def initialize(**attr)
    @strength = attr.fetch(:strength, 3)
    @health = attr.fetch(:health, 10)
    @stealth = attr.fetch(:stealth, 1)
    @actions = attr.fetch(:actions, {})

    @gold = 0
    @exp = 0

    @fled = false
  end

  def activate_action(action_name, target)
    actions[action_name].activate(target)
  end

  def gain_exp(amount) = @exp += amount

  def gain_gold(amount) = @gold += amount

  def damage(hit) = @health -= hit

  def fled? = @fled

  def flee
    @fled = true
  end
end
