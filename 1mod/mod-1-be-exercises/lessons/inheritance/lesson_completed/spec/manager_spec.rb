require "./lib/manager"

RSpec.describe Manager do
  describe "setup" do
    it "exists" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager).to be_a Manager
    end

    it "has base_salary, per_team_rate, and departments attributes" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.base_salary).to eq(12)
      expect(manager.per_team_rate).to eq 5
      expect(manager.departments).to be_instance_of Array
      expect(manager.departments.length).to eq (0)
    end

    it "can add_department" do
      manager = Manager.new(12, "Jane", 909)
      manager.add_department("Sales")
      expect(manager.departments).to eq(["Sales"])
      expect(manager.departments.length).to eq(1)
    end

    it "has benefits to start with" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.benefits).to eq([:sick_leave, :health_insurance])
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    # Write tests to prove that a Manager instance can have a Name and ID number, like any other Employee.
    # Also, a Manager should be able to receive a total compensation. Write at least one test that proves they can access this method.

    it "has a name" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.name).to eq("Jane")
    end

    it "has an ID" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.id).to eq(909)
    end

    it "still has 2 benefits, thanks to overriding" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.benefits).to eq([:sick_leave, :health_insurance])
    end

    it "receives a total_compensation" do
      manager = Manager.new(12, "Jane", 909)
      expect(manager.total_compensation).to eq(72)
    end

  end
end