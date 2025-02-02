# frozen_string_literal: true

require_relative 'dicepool'

module Actionable
  attr_reader :owner, :dicepool, :attribute, :difficulty

  def initialize(owner = nil)
    @owner = owner
    @dicepool = Dicepool.new

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
