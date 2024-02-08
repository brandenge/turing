require 'rails_helper'

RSpec.describe MovieFacade, :vcr do
  before(:each) do
    @user = create(:user)
    # @viewing_party1 = create(:viewing_party)
    # @user_viewing_party1 = create(:user_viewing_party, user: @user, user_type: 'host', viewing_party: @viewing_party1)

    @facade1 = MovieFacade.new(user: @user, type: :viewing_parties)
    @facade2 = MovieFacade.new(user: @user, type: :details, movie_id: 11)
    @facade3 = MovieFacade.new(user: @user, type: :top_rated)
    @facade4 = MovieFacade.new(user: @user, type: :search, query: 'star wars')
    @facades = [@facade1, @facade2, @facade3, @facade4]
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facades).to all(be_a(MovieFacade))
    end
  end

  describe '#user' do
    it 'has a user' do
      expect(@facade1.user).to be_a(User)
      expect(@facade2.user).to be_a(User)
      expect(@facade3.user).to be_a(User)
      expect(@facade4.user).to be_a(User)
      expect(@facade1.user).to eq(@user)
      expect(@facade2.user).to eq(@user)
      expect(@facade3.user).to eq(@user)
      expect(@facade4.user).to eq(@user)
    end
  end

  describe '#type' do
    it 'has a type' do
      expect(@facade1.type).to be_a(Symbol)
      expect(@facade2.type).to be_a(Symbol)
      expect(@facade3.type).to be_a(Symbol)
      expect(@facade4.type).to be_a(Symbol)
      expect(@facade1.type).to eq(:viewing_parties)
      expect(@facade2.type).to eq(:details)
      expect(@facade3.type).to eq(:top_rated)
      expect(@facade4.type).to eq(:search)
    end
  end

  describe '#movies' do
    it 'has movies' do
      expect(@facade1.movies).to be_a(Array)
      expect(@facade3.movies).to be_a(Array)
      expect(@facade4.movies).to be_a(Array)

      expect(@facade1.movies).to all(be_a(Hash))
      expect(@facade2.movies).to be_a(Movie)
      expect(@facade3.movies).to all(be_a(Movie))
      expect(@facade4.movies).to all(be_a(Movie))
    end
  end

  describe '#query' do
    context 'it is passed a query argument' do
      it 'returns the search query string' do
        expect(@facade4.query).to be_a(String)
        expect(@facade4.query).to eq('star wars')
      end
    end

    context 'it is not passed a query argument' do
      it 'defaults to nil' do
        expect(@facade1.query).to eq(nil)
        expect(@facade2.query).to eq(nil)
        expect(@facade3.query).to eq(nil)
      end
    end
  end

  describe '#user_name' do
    it 'returns the user name' do
      expect(@facade1.user_name).to be_a(String)
      expect(@facade2.user_name).to be_a(String)
      expect(@facade3.user_name).to be_a(String)
      expect(@facade4.user_name).to be_a(String)
      expect(@facade1.user_name).to eq(@user.name)
      expect(@facade2.user_name).to eq(@user.name)
      expect(@facade3.user_name).to eq(@user.name)
      expect(@facade4.user_name).to eq(@user.name)
    end
  end
end
