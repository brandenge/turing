require './lib/intern'

RSpec.describe Intern do
  describe "setup" do
    it "exists" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern).to be_a Intern
    end

    it "has a base_salary attribute" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.base_salary).to eq(5)
    end

    it "can get coffee" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern).to respond_to(:get_coffee)
      expect(intern.get_coffee).to eq("Who got the latte?")
    end

    it "has benefits" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.benefits).to be_instance_of Array
      expect(intern.benefits.length).to eq(2)
      expect(intern.benefits[0]).to eq(:gets_to_get_me_coffee)
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    # Write tests to prove that an Intern can be an Employee, with name and ID.
    # The Intern should also have the ability to have the "sick_leave" benefit, and not just the one it starts with.
    it "is_a Employee" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.is_a? Employee).to be true
    end

    it "has a name" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.name).to eq("Billy")
    end

    it "has an id" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.id).to eq(99)
    end

    it "has benefits" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.benefits).to eq([:gets_to_get_me_coffee, :sick_leave])
    end

    it "can calculate total_compensation" do
      intern = Intern.new(5, "Billy", 99)
      expect(intern.total_compensation).to eq(5)
    end
  end

end