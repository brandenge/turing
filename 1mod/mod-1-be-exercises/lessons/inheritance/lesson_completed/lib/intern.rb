require 'employee'
class Intern < Employee
  attr_reader :base_salary

  def initialize(base_salary, name, id)
    @base_salary = base_salary
    @bonus = 0 # "nil can't be coerced into Integer". So, we need to define a basic @bonus so that Employee's total_compensation will work. 
    super(name, id)
  end

  def get_coffee
    "Who got the latte?"
  end

  def benefits
    # [:gets_to_get_me_coffee]
    super.unshift(:gets_to_get_me_coffee) # can also use super.push or <<
  end

end