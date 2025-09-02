# frozen_string_literal: true

# Hero
class Hero
  attr_reader :damage, :health, :skills
  attr_accessor :printer

  def initialize(printer)
    @damage = 10
    @health = 5
    @printer = printer

    @skills = %i[stealth driving intimidation]
  end

  def print_stats
    return yield(damage, health, skills) if block_given?

    printer.print(damage, health, skills)
  end
end

class HTMLPrinter
  def print(damage, health, skills)
    result = header
    result += content(damage, health, skills)
    result += footer
    result
  end

  def header
    '<html>'
  end

  def footer
    '</html>'
  end

  def content(damage, health, skills)
    raise 'You must implement content'
  end
end

# BattleStats
class BattleStats < HTMLPrinter
  def content(damage, health, skills)
    "Damage: #{damage}\nHealth: #{health}"
  end
end

# SkillStats
class SkillStats < HTMLPrinter
  def content(damage, health, skills)
    skills.inject('') { |result, skill| "#{result}#{skill.to_s.capitalize}\n" }
  end
end
