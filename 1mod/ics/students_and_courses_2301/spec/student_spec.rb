require 'spec_helper'

RSpec.describe Student do
  before(:each) do
    @student_1 = Student.new(STUDENT_1)
    @student_2 = Student.new(STUDENT_2)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@student_1).to be_a(Student)
      expect(@student_2).to be_a(Student)
    end
  end

  describe '#name, #age' do
    it 'has attributes' do
      expect(@student_1.name).to eq(STUDENT_1[:name])
      expect(@student_1.age).to eq(STUDENT_1[:age])
    end

    it 'has different attributes' do
      expect(@student_2.name).to eq(STUDENT_2[:name])
      expect(@student_2.age).to eq(STUDENT_2[:age])
    end
  end

  describe '#scores' do
    it 'starts empty' do
      expect(@student_1.scores).to eq([])
      expect(@student_2.scores).to eq([])
    end
  end

  describe '#log_score' do
    it 'adds a score to scores' do
      @student_1.log_score(89)
      expect(@student_1.scores).to eq([89])
    end

    it 'can add a score to scores multiple times' do
      @student_1.log_score(89)
      expect(@student_1.scores).to eq([89])
      @student_1.log_score(78)
      expect(@student_1.scores).to eq([89, 78])
    end
  end

  describe '#grade' do
    it 'returns an average of all scores' do
      @student_1.log_score(89)
      @student_1.log_score(78)
      expect(@student_1.grade).to eq(83.5)
    end

    it 'returns an average of all scores again' do
      @student_1.log_score(96)
      @student_1.log_score(84)
      @student_1.log_score(77)
      @student_1.log_score(91)
      expect(@student_1.grade).to eq(87)
    end
  end
end
