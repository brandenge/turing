require 'spec_helper'

RSpec.describe Course do
  course_1 = Course.new(*COURSE_1.values)
  course_2 = Course.new(*COURSE_2.values)

  student_1 = Student.new(STUDENT_1)
  student_2 = Student.new(STUDENT_2)
  student_3 = Student.new(STUDENT_3)
  student_4 = Student.new(STUDENT_4)
  student_5 = Student.new(STUDENT_5)

  course_1.enroll(student_1)
  course_1.enroll(student_2)
  course_2.enroll(student_3)
  course_2.enroll(student_4)
  course_2.enroll(student_5)

  student_1.log_score(89)
  student_1.log_score(78)

  student_2.log_score(96)
  student_2.log_score(84)
  student_2.log_score(77)
  student_2.log_score(91)

  student_3.log_score(82)
  student_3.log_score(78)
  student_3.log_score(74)
  student_3.log_score(73)

  student_4.log_score(99)
  student_4.log_score(98)
  student_4.log_score(96)
  student_4.log_score(97)

  student_5.log_score(65)
  student_5.log_score(76)
  student_5.log_score(58)
  student_5.log_score(71)

  before(:each) do
    @gradebook = Gradebook.new(*GRADEBOOK_1.values)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@gradebook).to be_a(Gradebook)
    end
  end

  describe '#instructor' do
    it 'has an instructor' do
      expect(@gradebook.instructor).to eq(GRADEBOOK_1[:instructor])
    end

    it 'has a a different instructor' do
      gradebook_2 = Gradebook.new('Sally')
      expect(gradebook_2.instructor).to eq('Sally')
    end
  end

  describe '#courses' do
    it 'starts empty' do
      expect(@gradebook.courses).to eq([])
    end
  end

  describe '#add_course' do
    it 'adds a course to #courses' do
      @gradebook.add_course(course_1)
      expect(@gradebook.courses).to eq([course_1])
    end

    it 'adds a course multiple times' do
      @gradebook.add_course(course_1)
      expect(@gradebook.courses).to eq([course_1])
      @gradebook.add_course(course_2)
      expect(@gradebook.courses).to eq([course_1, course_2])
    end
  end

  describe '#list_all_students' do
    before(:each) do
      @gradebook.add_course(course_1)
      @gradebook.add_course(course_2)
    end

    it 'returns a hash' do
      expect(@gradebook.list_all_students).to be_a(Hash)
    end

    it 'has Course objects for keys' do
      expect(@gradebook.list_all_students.keys.all? do |course, students|
        course.is_a?(Course)
      end).to be(true)
    end

    it 'has an array of Student objects for values' do
      expect(@gradebook.list_all_students.values.all? do |students|
        students.all? { |student| student.is_a?(Student) }
      end).to be(true)
    end

    it 'returns the correct hash of course keys and student arrays' do
      expected = {
        course_1 => course_1.students,
        course_2 => course_2.students
      }
      expect(@gradebook.list_all_students).to eq(expected)
    end
  end

  describe '#students_array' do
    before(:each) do
      @gradebook.add_course(course_1)
      @gradebook.add_course(course_2)
    end

    it 'returns an array of all students' do
      expect(@gradebook.students_array).to eq([student_1, student_2,
        student_3, student_4, student_5])
    end
  end

  describe '#students_below' do
    before(:each) do
      @gradebook.add_course(course_1)
      @gradebook.add_course(course_2)
    end

    it 'returns the correct array of student objects whose grades are below the threshold' do
      expect(@gradebook.students_below(80)).to eq([student_3, student_5])
    end

    it 'returns the correct array again with a different threshold' do
      expect(@gradebook.students_below(90)).to eq([student_1, student_2, student_3, student_5])
    end
  end

  describe '#students_with_grade_in_range' do
    before(:each) do
      @gradebook.add_course(course_1)
      @gradebook.add_course(course_2)
    end

    it 'returns the correct array of students with grades in the given range' do
      expect(@gradebook.students_with_grade_in_range(85, 100)).to eq([student_2, student_4])
    end

    it 'returns the correct array of students with grades in a different range' do
      expect(@gradebook.students_with_grade_in_range(60, 85)).to eq([student_1, student_3, student_5])
    end
  end
end
