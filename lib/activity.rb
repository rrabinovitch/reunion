class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    @participants.reduce({}) do |owed, (name, amount_paid)|
      owed[name] = split - amount_paid
      owed
    end
  end
end
