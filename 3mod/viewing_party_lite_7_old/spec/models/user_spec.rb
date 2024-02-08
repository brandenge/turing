require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_viewing_parties) }
    it { should have_many(:viewing_parties).through(:user_viewing_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'instance methods' do
    describe '#viewing_party_movie_ids' do
      it 'returns an array of all the viewing parties\' movie id\'s' do
        user = create(:user)
        viewing_party1 = create(:viewing_party, movie_id: 11)
        viewing_party2 = create(:viewing_party, movie_id: 13)
        viewing_party3 = create(:viewing_party, movie_id: 278)
        user_viewing_party1 = create(:user_viewing_party, user:, viewing_party: viewing_party1)
        user_viewing_party2 = create(:user_viewing_party, user:, viewing_party: viewing_party2)
        user_viewing_party3 = create(:user_viewing_party, user:, viewing_party: viewing_party3)

        expect(user.viewing_party_movie_ids).to eq([11, 13, 278])
      end
    end
  end
end
