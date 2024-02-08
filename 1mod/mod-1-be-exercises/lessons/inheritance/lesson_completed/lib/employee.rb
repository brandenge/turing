require 'pry'

class Employee
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
    # If we uncomment this pry, what will be output when we type `self` or `self.class` in the Terminal?
    #  binding.pry
  end

  def total_compensation
    # Uncomment the pry below, and check what the value of @base_salary and @bonus is. Where do these values come from?
    # binding.pry
    @base_salary + @bonus
  end

  def benefits
    [:sick_leave]
  end

end