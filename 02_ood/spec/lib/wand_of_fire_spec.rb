# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/wand_of_fire'

describe WandOfFire do
  let(:action) { described_class.new }

  it_behaves_like 'actionable'
end
