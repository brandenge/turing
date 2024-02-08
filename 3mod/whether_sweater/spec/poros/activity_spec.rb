require 'rails_helper'

RSpec.describe Activity do
  subject(:activity) { Activity.new(ActivityFixture::ATTRIBUTES) }

  describe '#initialize' do
    it 'exists' do
      expect(activity).to be_an(Activity)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(activity.activity).to eq('Do yoga')
      expect(activity.type).to eq('recreational')
      expect(activity.participants).to eq(1)
      expect(activity.price).to eq(0)
      expect(activity.link).to eq('')
      expect(activity.key).to eq('4688012')
      expect(activity.accessibility).to eq(0.9)
    end
  end
end
