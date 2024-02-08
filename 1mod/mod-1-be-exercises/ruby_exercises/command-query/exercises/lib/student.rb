class Student
  def initialize
    @study_quality = 2
  end

  def grade
    case @study_quality
      when 4 then 'A'
      when 3 then 'B'
      when 2 then 'C'
      when 1 then 'D'
      when 0 then 'F'
    end
  end

  def study
    @study_quality = @study_quality >= 4 ? 4 : @study_quality + 1
  end

  def slack_off
    @study_quality = @study_quality <= 0 ? 0 : @study_quality - 1
  end
end
