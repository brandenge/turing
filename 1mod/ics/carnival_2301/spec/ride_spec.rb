require 'spec_helper'

RSpec.describe Ride do
  let(:ride1) { Ride.new(RIDE1) }
  let(:ride2) { Ride.new(RIDE2) }
  let(:ride3) { Ride.new(RIDE3) }

  let(:visitor1) { Visitor.new(*VISITOR1.values) }
  let(:visitor2) { Visitor.new(*VISITOR2.values) }
  let(:visitor3) { Visitor.new(*VISITOR3.values) }

  before(:each) do
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
  end

  describe '#initialize' do
    it 'exists' do
      expect(ride1).to be_a(Ride)
      expect(ride2).to be_a(Ride)
      expect(ride3).to be_a(Ride)
    end
  end

  describe 'attributes - #name, #min_height, #admission_fee, #excitement, and #total_revenue' do
    it 'has a name' do
      expect(ride1.name).to eq(RIDE1[:name])
      expect(ride2.name).to eq(RIDE2[:name])
      expect(ride3.name).to eq(RIDE3[:name])
    end

    it 'has a minimum height' do
      expect(ride1.min_height).to eq(RIDE1[:min_height])
      expect(ride2.min_height).to eq(RIDE2[:min_height])
      expect(ride3.min_height).to eq(RIDE3[:min_height])
    end

    it 'has an admission fee' do
      expect(ride1.admission_fee).to eq(RIDE1[:admission_fee])
      expect(ride2.admission_fee).to eq(RIDE2[:admission_fee])
      expect(ride3.admission_fee).to eq(RIDE3[:admission_fee])
    end

    it 'has an excitement level' do
      expect(ride1.excitement).to eq(RIDE1[:excitement])
      expect(ride2.excitement).to eq(RIDE2[:excitement])
      expect(ride3.excitement).to eq(RIDE3[:excitement])
    end
  end

  describe '#total_revenue' do


    it 'starts at 0' do
      expect(ride1.total_revenue).to eq(0)
      expect(ride2.total_revenue).to eq(0)
      expect(ride3.total_revenue).to eq(0)
    end

    it 'returns the total sum of admission fees collected for the ride' do
      ride1.board_rider(visitor1)
      expect(ride1.total_revenue).to eq(1)
      ride1.board_rider(visitor2)
      expect(ride1.total_revenue).to eq(2)
      ride1.board_rider(visitor1)
      expect(ride1.total_revenue).to eq(3)
    end
  end

  describe '#board_rider' do
    context 'the rider can go on the ride' do
      it 'subtracts the admission fee from the visitor\'s spending money' do
        ride1.board_rider(visitor1)
        expect(visitor1.spending_money).to eq(9)
        ride1.board_rider(visitor2)
        expect(visitor2.spending_money).to eq(4)
        ride1.board_rider(visitor1)
        expect(visitor1.spending_money).to eq(8)
      end

      it 'adds the admission fee to the ride\'s total revenue' do
        ride1.board_rider(visitor1)
        expect(ride1.total_revenue).to eq(1)
        ride1.board_rider(visitor2)
        expect(ride1.total_revenue).to eq(2)
        ride1.board_rider(visitor1)
        expect(ride1.total_revenue).to eq(3)
      end

      it 'adds the rider to the rider log with the number of times they have gone on the ride' do
        expected = {
          visitor1 => 2,
          visitor2 => 1,
        }

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)

        expect(ride1.rider_log).to eq(expected)
      end
    end

    context 'the rider cannot go on the ride' do
      it 'does nothing if the visitor\'s height does not meet the ride\'s minimum height' do
        ride1.board_rider(visitor3)

        expect(visitor3.spending_money).to eq(15)
        expect(ride1.total_revenue).to eq(0)
        expect(ride1.rider_log).to eq({})
      end

      it 'does nothing if the visitor does not have the ride\'s excitement level as a preference' do
        ride3.board_rider(visitor2)

        expect(visitor2.spending_money).to eq(5)
        expect(ride1.total_revenue).to eq(0)
        expect(ride1.rider_log).to eq({})
      end

      it 'does nothing if the visitor does not have the spending money to pay for the ride\'s admission fee' do
        visitor4 = Visitor.new('Amy', 60, '$0')
        ride1.board_rider(visitor4)

        expect(visitor4.spending_money).to eq(0)
        expect(ride1.total_revenue).to eq(0)
        expect(ride1.rider_log).to eq({})
      end
    end
  end

  describe '#rider_log' do
    it 'returns a hash with visitors who have previously ridden the ride as keys, and the number of times those visitors have ridden the ride as values' do
      expected1 = {
        visitor1 => 1
      }

      expected2 = {
        visitor1 => 1,
        visitor2 => 1
      }

      expected3 = {
        visitor1 => 2,
        visitor2 => 1
      }

      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq(expected1)

      ride1.board_rider(visitor2)
      expect(ride1.rider_log).to eq(expected2)

      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq(expected3)
    end
  end
end
