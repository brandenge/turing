require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  before(:each) do
    @dealership_1 = Dealership.new('Acme Auto', '123 Main Street')
    @dealership_2 = Dealership.new('Acme Auto', '123 Main Street')
    @car_1 = Car.new('Ford Mustang', 1500, 36) # total cost: 54000
    @car_2 = Car.new('Toyota Prius', 1000, 48) # total cost: 48000
    @car_3 = Car.new('Toyota Tercel', 500, 48) # total cost: 24000
    @car_4 = Car.new('Chevrolet Bronco', 1250, 24) # total cost: 30000
    @dealership_2.add_car(@car_1)
    @dealership_2.add_car(@car_2)
    @dealership_2.add_car(@car_3)
    @dealership_2.add_car(@car_4)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dealership_1).to be_a(Dealership)
    end
  end

  describe '#inventory' do
    it 'it starts with an empty inventory' do
      expect(@dealership_1.inventory).to eq([])
    end
  end

  describe '#inventory_count' do
    it 'starts with an inventory count of 0' do
      expect(@dealership_1.inventory_count).to eq(0)
    end
  end

  describe '#add_car' do
    it 'adds a car to inventory' do
      expect(@dealership_1.inventory).to eq([])
      expect(@dealership_1.inventory_count).to eq(0)

      @dealership_1.add_car(@car_1)
      expect(@dealership_1.inventory).to eq([@car_1])
      expect(@dealership_1.inventory_count).to eq(1)
    end

    it 'adds another car to inventory' do
      expect(@dealership_1.inventory).to eq([])
      expect(@dealership_1.inventory_count).to eq(0)

      @dealership_1.add_car(@car_1)
      expect(@dealership_1.inventory).to eq([@car_1])
      expect(@dealership_1.inventory_count).to eq(1)

      @dealership_1.add_car(@car_2)
      expect(@dealership_1.inventory).to eq([@car_1, @car_2])
      expect(@dealership_1.inventory_count).to eq(2)
    end
  end

  describe '#has_inventory?' do
    it 'returns false when there are no cars in inventory' do
      expect(@dealership_1.has_inventory?).to eq(false)
    end

    it 'returns true when there is at least 1 car in inventory' do
      @dealership_1.add_car(@car_1)
      expect(@dealership_1.has_inventory?).to eq(true)
    end
  end

  describe '#cars_by_make' do
    it 'returns a list of cars of the given make' do
      expect(@dealership_2.cars_by_make('Toyota')).to eq([@car_2, @car_3])
    end

    it 'returns a list of cars of a different make' do
      expect(@dealership_2.cars_by_make('Ford')).to eq([@car_1])
    end
  end

  describe '#total_value' do
    it 'returns the total value of cars in the dealership inventory' do
      expect(@dealership_2.total_value).to eq(156_000)
    end
  end

  describe '#details' do
    it 'returns a hash with total_value and address key/value pairs' do
      expected = {
        'total_value' => 156_000,
        'address' => '123 Main Street'
      }
      expect(@dealership_2.details).to eq(expected)
    end
  end

  describe '#average_price_of_car' do
    it 'returns the average price of a car as a string' do
      expect(@dealership_2.average_price_of_car).to eq('39,000')
    end
  end

  describe '#cars_sorted_by_price' do
    it 'returns the car inventory sorted by price' do
      expect(@dealership_2.cars_sorted_by_price)
      .to eq([@car_3, @car_4, @car_2, @car_1])
    end
  end

  describe '#inventory_hash' do
    it 'returns a hash of cars by make' do
      expected = {
        'Ford' => [@car_1],
        'Toyota' => [@car_2, @car_3],
        'Chevrolet' => [@car_4]
      }
      expect(@dealership_2.inventory_hash).to eq(expected)
    end
  end
end
