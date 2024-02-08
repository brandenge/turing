class Manager
  attr_reader :base_salary, :per_team_rate, :departments
  def initialize(base_salary)
    @base_salary = base_salary
    @per_team_rate = 5
    @departments = []
  end

  def add_department(dept)
    @departments << dept
  end

  def benefits
    [:sick_leave, :health_insurance]
  end

end