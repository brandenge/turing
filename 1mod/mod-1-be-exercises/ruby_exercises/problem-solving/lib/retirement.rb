class Retirement
  def calculate(n1, n2)
    return "Error. Age cannot be negative." if n1 < 0
    return "Error. Retirement age cannot be negative." if n2 < 0
    current_year = 2015
    "You have #{n2 - n1} years left until you can retire. "\
    "It is #{current_year}, so you can retire in #{current_year + n2 - n1}."
  end
end
