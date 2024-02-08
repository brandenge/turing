require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many :employee_tickets }
    it { should have_many(:employees).through(:employee_tickets) }
    it { should have_many(:departments).through(:employees) }
  end

  describe 'validations' do
    it { should validate_presence_of :subject }
    it { should validate_presence_of :age }
    it { should validate_numericality_of :age }
  end
end
