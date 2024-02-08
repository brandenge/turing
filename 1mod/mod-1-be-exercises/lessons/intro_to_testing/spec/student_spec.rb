require 'rspec'
require './lib/student'

describe Student do
  before(:each) do
    @name_1 = 'Penelope'
    @name_2 = 'Logan'
    @student_1 = Student.new(@name_1)
    @student_2 = Student.new(@name_2)
  end

  describe '#initialize' do
    it 'is an instance of student' do
      expect(@student_1).to be_a(Student)
    end

    describe '#name' do
      it 'has a name' do
        expect(@student_1.name).to eq(@name_1)
      end
    end

    describe '#cookies' do
      it 'starts with no cookies' do
        expect(@student_1.cookies).to eq([])
      end

      it 'has one cookie' do
        cookie = 'Chocolate Chunk'
        @student_1.add_cookie(cookie)
        expect(@student_1.cookies).to eq([cookie])
      end

      it 'has more than one cookie' do
        cookie_1 = 'Chocolate Chunk'
        cookie_2 = 'Snickerdoodle'
        @student_1.add_cookie(cookie_1)
        @student_1.add_cookie(cookie_2)
        expect(@student_1.cookies).to eq([cookie_1, cookie_2])
      end
    end

    describe '#add_cookie' do
      it 'can add a cookie' do
        cookie = 'Chocolate Chunk'
        @student_1.add_cookie(cookie)
        expect(@student_1.cookies).to eq([cookie])
      end

      it 'can add more than one cookie' do
        cookie_1 = 'Chocolate Chunk'
        @student_1.add_cookie(cookie_1)
        expect(@student_1.cookies).to eq([cookie_1])

        cookie_2 = 'Snickerdoodle'
        @student_1.add_cookie(cookie_2)
        expect(@student_1.cookies).to eq([cookie_1, cookie_2])
      end
    end
  end
end
