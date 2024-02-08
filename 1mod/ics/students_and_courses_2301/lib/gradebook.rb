class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    @courses.to_h do |course|
      [course, course.students]
    end
  end

  def students_array
    list_all_students.values.flatten
  end

  def students_below(threshold)
    students_array.filter { |student| student.grade < threshold }
  end

  def students_with_grade_in_range(min, max)
    students_array.filter do |student|
      student.grade >= min && student.grade <= max
    end
  end
end
