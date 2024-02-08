require 'spec_helper'

RSpec.describe Course do
  before(:each) do
    @course_1 = Course.new(*COURSE_1.values)
    @course_2 = Course.new(*COURSE_2.values)

    @student_1 = Student.new(STUDENT_1)
    @student_2 = Student.new(STUDENT_2)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@course_1).to be_a(Course)
      expect(@course_2).to be_a(Course)
    end
  end

  describe '#name, #capacity' do
    it 'has attributes' do
      expect(@course_1.name).to eq(COURSE_1[:name])
      expect(@course_1.capacity).to eq(COURSE_1[:capacity])
    end

    it 'has different attributes' do
      expect(@course_2.name).to eq(COURSE_2[:name])
      expect(@course_2.capacity).to eq(COURSE_2[:capacity])
    end
  end

  describe '#students' do
    it 'starts empty' do
      expect(@course_1.students).to eq([])
      expect(@course_2.students).to eq([])
    end
  end

  describe '#enroll' do
    it 'adds a student to @students' do
      expect(@course_1.students).to eq([])
      @course_1.enroll(@student_1)
      expect(@course_1.students).to eq([@student_1])
    end

    it 'can add a student to @students multiple times' do
      require 'pry-byebug'; require 'pry'; binding.pry;
      expect(@course_1.students).to eq([])
      @course_1.enroll(@student_1)
      expect(@course_1.students).to eq([@student_1])
      @course_1.enroll(@student_2)
      expect(@course_1.students).to eq([@student_1, @student_2])
    end
  end

  describe '#full?' do
    it 'returns false under the number of students is under capacity' do
      expect(@course_1.full?).to eq(false)
    end

    it 'returns true when the number of students is at capacity' do
      @course_1.enroll(@student_1)
      @course_1.enroll(@student_2)
      expect(@course_1.full?).to eq(true)
    end
  end
end
