require 'rails_helper'

RSpec.describe EmployeeTicket, type: :model do
  describe 'relationships' do
    it { should belong_to :employee }
    it { should belong_to :ticket }
  end

  describe 'validations' do
    it { should validate_presence_of :employee_id }
    it { should validate_presence_of :ticket_id }
    it { should validate_numericality_of :employee_id }
    it { should validate_numericality_of :ticket_id }
  end
end
