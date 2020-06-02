class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum { |activity| activity.total_cost}
  end

  def breakout
    @activities.reduce({}) do |breakout, activity|
      activity.owed.each do |name, owed|
        breakout[name] ||= 0
        breakout[name] += owed
      end
      breakout
    end
  end

  def summary
    breakout.map { |name, owed| "#{name}: #{owed}" }.join("\n")
  end
end
