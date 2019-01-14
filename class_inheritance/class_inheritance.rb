class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss 
  end

  def bonus(multiplier)
    bonus = self.salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    bonus = salary_total_of_employees_beneath_you * multiplier
  end

  def salary_total_of_employees_beneath_you
    total = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        total += employee.salary
        total += employee.salary_total_of_employees_beneath_you
      else
        total += employee.salary
      end
    end

    total
  end
end

if __FILE__ == $PROGRAM_NAME
  david = Employee.new("David", "TA", 10_000, "Darren")
  shawna = Employee.new("Shawna", "TA", 12_000, "Darren")
  darren = Manager.new("Darren", "TA Manager", 78_000, "Ned", [david, shawna])
  ned = Manager.new("Ned", "Founder", 1_000_000, nil, [darren])

  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)

end