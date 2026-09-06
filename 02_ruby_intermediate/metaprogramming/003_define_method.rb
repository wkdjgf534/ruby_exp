# frozen_string_literal: true

class TeamReport
  teams = %w[astros ranges athletics angels marlins]

  teams.each do |team|
    define_method("report_for_#{team}") do |name|
      "Report for #{name}"
    end
  end
end

team = TeamReport.new
p team.report_for_astros('Astros')
p team.report_for_ranges('Rangers')
p team.report_for_angels('Angels')
