require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe 'relationships' do
    it { should belong_to :dish }
    it { should belong_to :ingredient }
    it { should have_one(:chef).through(:dish) }
  end
end
