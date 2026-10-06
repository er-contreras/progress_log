# frozen_string_literal: true

# Gaol by hour
class ByHour
  attr_accessor(:time, :habit)

  def initialize(time, habit)
    @time = time
    @habit = habit
  end
end
