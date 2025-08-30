# frozen_string_literal: true

# Hero
class Hero
  attr_reader :damage, :abilities

  def initialize
    @damage = damage_rating
    @abilities = occupation_abilities
  end

  def damage_rating = 10

  def occupation_abilities = []

  def attack
    "Attacked dealing #{damage} damage"
  end

  def greet
    greeting = ['Hello']
    greeting << unique_greeting_line
    greeting
  end

  def unique_greeting_line = raise 'You must define unique_greeting_line'
end

# Warrior
class Warrior < Hero
  def damage_rating = 15

  def occupation_abilities = [:strike]

  def unique_greeting_line = 'Warrior is ready to fight'
end

# Mage
class Mage < Hero
  def damage_rating = 7

  def occupation_abilities = [:magic_arrow]
end
