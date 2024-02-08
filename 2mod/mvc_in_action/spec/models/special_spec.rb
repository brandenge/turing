require 'rails_helper'

RSpec.describe Special, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :runtime }
  end

  describe 'relationships' do
    it { should belong_to :comedian }
  end
end
