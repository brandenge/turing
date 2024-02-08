require 'rspec'
require 'pry'
require './lib/student'

RSpec.describe Student do
  before(:each) do
    #setup for all tests below
    @student = Student.new('Bruce')
  end

  describe 'instantiation' do
    it 'creates an instance' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'sets a name' do
      expect(@student.name).to eq("Bruce")
    end

    it 'starts with no group' do
      expect(@student.group).to eq(nil)
    end
  end

  describe 'methods' do
    it 'can be assigned to a group' do
      @student.group = :bhatt

      expect(@student.group).to eq(:bhatt)
    end
  end
end
