class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end


class Manager < Employee
  attr_reader :employees

  def initalize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total = employees.inject(0) do |accumulator, emp|
      accumulator + emp.salary
    end
    total * multiplier
  end

end


ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78, ned)
### etc
