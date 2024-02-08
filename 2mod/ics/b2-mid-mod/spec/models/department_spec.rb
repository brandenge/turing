require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'relationships' do
    it { should have_many :employees }
    it { should have_many(:employee_tickets).through(:employees) }
    it { should have_many(:tickets).through(:employee_tickets) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :floor }
  end
end
