# frozen_string_literal: true

require 'action'

class WandOfFire
  include Actionable

  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end
end
