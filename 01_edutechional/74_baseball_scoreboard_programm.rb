# frozen_string_literal: true

require 'rspec'

# In this exercise, you'll build out a scoreboard program that generates an inning by inning score for
# a baseball team along with a dynamic total.
#
# https://www.youtube.com/watch?v=w-P7OMtoGbw&list=PLgYiyoyNPrv_UhCfDLOT8yZPmVeOFjqGH&index=81

class Scoreboard
  attr_reader :score

  def initialize(team)
    @team = team
    @score = score_builder
  end

  def score_builder
    {
      @team => {
        1 => 0,
        2 => 0,
        3 => 0,
        4 => 0,
        5 => 0,
        6 => 0,
        7 => 0,
        8 => 0,
        9 => 0
      }
    }
  end

  def generate_total
    @score[@team].values.sum
  end

  def add_run(inning: 0)
    @score[@team][inning] += 1
  end
end

team = Scoreboard.new('Padres')
team.add_run(inning: 4)
team.add_run(inning: 4)
team.add_run(inning: 4)
team.add_run(inning: 4)
team.add_run(inning: 9)

p team.score
p team.generate_total

describe 'Scoreboard' do
  before { @team = Scoreboard.new('Astros') }

  it 'should properly calculate the total score for a team' do
    @team.add_run(inning: 1)
    @team.add_run(inning: 7)
    @team.add_run(inning: 9)
    expect(@team.generate_total).to eq(3)
  end

  it 'should generate a hash with the total runs scored each inning' do
    @team.add_run(inning: 3)
    @team.add_run(inning: 3)
    @team.add_run(inning: 5)
    @team.add_run(inning: 8)
    expect(@team.score)
      .to eq({ 'Astros' => { 1 => 0, 2 => 0, 3 => 2, 4 => 0, 5 => 1, 6 => 0, 7 => 0, 8 => 1, 9 => 0 } })
  end

  it 'should generate a hash with the inning and 0 values for the runs each inning when a Scoreboard is created' do
    expect(@team.score)
      .to eq({ 'Astros' => { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0 } })
  end
end
