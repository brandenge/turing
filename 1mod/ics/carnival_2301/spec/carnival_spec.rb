require 'spec_helper'

RSpec.describe Carnival do
  let(:carnival1) { Carnival.new(CARNIVAL1) }
  let(:carnival2) { Carnival.new(CARNIVAL2) }

  let(:ride1) { Ride.new(RIDE1) }
  let(:ride2) { Ride.new(RIDE2) }
  let(:ride3) { Ride.new(RIDE3) }

  let(:visitor1) { Visitor.new(*VISITOR1.values) }
  let(:visitor2) { Visitor.new(*VISITOR2.values) }
  let(:visitor3) { Visitor.new(*VISITOR3.values) }

  before(:each) do
    Carnival.reset

    carnival1.add_ride(ride1)
    carnival1.add_ride(ride2)
    carnival1.add_ride(ride3)

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor3.add_preference(:gentle)
    visitor3.add_preference(:thrilling)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride2.board_rider(visitor3)
    ride3.board_rider(visitor3)
    ride3.board_rider(visitor3)
    ride3.board_rider(visitor3)
  end

  describe '#initialize' do
    it 'exists' do
      expect(carnival1).to be_a(Carnival)
      expect(carnival2).to be_a(Carnival)
    end
  end

  describe '#duration' do
    it 'has a duration' do
      expect(carnival1.duration).to eq(CARNIVAL1[:duration])
      expect(carnival2.duration).to eq(CARNIVAL2[:duration])
    end
  end

  describe '#rides' do
    it 'starts empty' do
      carnival3 = Carnival.new({ duration: '7 days' })
      expect(carnival3.rides).to eq([])
    end

    it 'can list all the rides in the carnival' do
      expect(carnival1.rides).to eq([ride1, ride2, ride3])
    end
  end

  describe '#add_ride' do
    it 'adds a ride to the carnival\'s list of rides' do
      carnival3 = Carnival.new({ duration: '7 days' })
      carnival3.add_ride(ride1)
      expect(carnival3.rides).to eq([ride1])
      carnival3.add_ride(ride2)
      expect(carnival3.rides).to eq([ride1, ride2])
      carnival3.add_ride(ride3)
      expect(carnival3.rides).to eq([ride1, ride2, ride3])
    end
  end

  describe '#most_popular_ride' do
    it 'returns the ride with the most rides' do
      expect(carnival1.most_popular_ride).to eq(ride3)
    end
  end

  describe '#most_profitable_ride' do
    it 'returns the ride with the most total revenue' do
      expect(carnival1.most_profitable_ride).to eq(ride2)
    end
  end

  describe '#total_revenue' do
    it 'returns the sum of total revenue collected from admission fees for all rides in the carnival' do
      expect(carnival1.total_revenue).to eq(18)
    end
  end

  describe '#summary' do
    it 'includes a visitor count' do
      expect(carnival1.summary[:visitor_count]).to eq(3)
    end

    it 'includes revenue earned' do
      expect(carnival1.summary[:total_revenue]).to eq(18)
    end

    it 'includes a list of visitors, each visitor\'s favorite ride, and how much total money each visitor spent' do
      expected = {
        visitor1 => {
          :favorite_ride => ride1,
          :total_spent => 2
        },
        visitor2 => {
          :favorite_ride => ride2,
          :total_spent => 5
        },
        visitor3 => {
          :favorite_ride => ride3,
          :total_spent => 11
        }
      }

      expect(carnival1.summary[:visitors]).to eq(expected)
    end

    it 'includes a list of rides, who rode each ride, and the ride\'s total revenue' do
      expected = {
        ride1 => {
          :riders => [visitor1],
          :total_revenue => 2
        },
        ride2 => {
          :riders => [visitor2, visitor3],
          :total_revenue => 10
        },
        ride3 => {
          :riders => [visitor3],
          :total_revenue => 6
        }
      }

      expect(carnival1.summary[:rides]).to eq(expected)
    end
  end

  describe '::total_revenue' do
    let(:visitor4) { Visitor.new(*VISITOR1.values) }
    let(:visitor5) { Visitor.new(*VISITOR2.values) }
    let(:visitor6) { Visitor.new(*VISITOR3.values) }

    let(:ride4) { Ride.new(RIDE1) }
    let(:ride5) { Ride.new(RIDE2) }
    let(:ride6) { Ride.new(RIDE3) }

    before(:each) do
      carnival2.add_ride(ride4)
      carnival2.add_ride(ride5)
      carnival2.add_ride(ride6)

      visitor4.add_preference(:gentle)
      visitor5.add_preference(:gentle)
      visitor6.add_preference(:gentle)
      visitor6.add_preference(:thrilling)

      ride4.board_rider(visitor4)
      ride4.board_rider(visitor4)
      ride5.board_rider(visitor5)
      ride5.board_rider(visitor6)
      ride6.board_rider(visitor6)
      ride6.board_rider(visitor6)
      ride6.board_rider(visitor6)
    end

    it 'returns the total revenue of all instances of the Carnival class' do
      expect(Carnival.total_revenue).to eq(36)
    end
  end
end
