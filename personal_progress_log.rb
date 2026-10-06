# frozen_string_literal: true

require_relative 'by_hour'

# Main function
class PersonalProgressLog
  attr_reader :by_hour

  def initialize
    @by_hour = ByHour.new(Time.now, 'Meditation')
  end
end

personal_progress_log = PersonalProgressLog.new
p personal_progress_log.by_hour
p personal_progress_log.by_hour.time
p personal_progress_log.by_hour.habit
