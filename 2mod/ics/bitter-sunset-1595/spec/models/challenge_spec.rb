require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe "validations" do
    it {should validate_presence_of :theme}
    it {should validate_presence_of :project_budget}
  end

  describe "relationships" do
    it {should have_many :projects}
  end
end
