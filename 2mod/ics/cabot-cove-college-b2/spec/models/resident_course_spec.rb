require 'rails_helper'

RSpec.describe ResidentCourse, type: :model do

  describe 'relationships' do
    it {should belong_to :resident}
    it {should belong_to :course}
  end

end
