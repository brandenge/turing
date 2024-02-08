require 'rails_helper'

RSpec.describe CustomError do
  subject(:custom_error) { CustomError.new('Custom error message.', 400) }

  describe '#initialize' do
    it 'exists' do
      expect(custom_error).to be_a(CustomError)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(custom_error.message).to eq('Custom error message.')
      expect(custom_error.status).to eq(400)
    end
  end
end
