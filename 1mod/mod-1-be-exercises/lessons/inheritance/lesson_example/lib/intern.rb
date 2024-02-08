class Intern
  attr_reader :base_salary
  
  def initialize(base_salary)
    @base_salary = base_salary
  end

  def get_coffee
    "Who got the latte?"
  end

  def benefits
    [:gets_to_get_me_coffee]
  end

end