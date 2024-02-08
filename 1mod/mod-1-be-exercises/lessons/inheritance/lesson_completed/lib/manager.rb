require "employee"
class Manager < Employee
  attr_reader :base_salary, :per_team_rate, :departments
  def initialize(base_salary, name, id)
    @base_salary = base_salary
    @per_team_rate = 5
    @departments = []
    super(name, id)
  end

  def add_department(dept)
    @departments << dept
  end

  def total_compensation
    @bonus = @base_salary * @per_team_rate
    super
    # We're defining @bonus here as their base_salary * @per_team_rate, and then letting the parent class's total_compensation method take care of the rest!
  end

  def benefits
    [:sick_leave, :health_insurance]
  end

end