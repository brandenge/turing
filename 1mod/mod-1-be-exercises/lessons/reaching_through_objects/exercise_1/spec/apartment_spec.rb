require 'spec_helper'

RSpec.describe Apartment do
  before(:each) do
    @apt_1 = Apartment.new
    @apt_2 = Apartment.new
    @room_1 = Room.new('bathroom')
    @room_2 = Room.new('laundry')
    @room_3 = Room.new('kitchen')
    @room_4 = Room.new('bedroom')
    @room_5 = Room.new('living')
  end

  describe '#initialize' do
    it 'initializes correctly' do
      expect(@apt_1).to be_a(Apartment)
    end

    it 'initializes correctly again' do
      expect(@apt_2).to be_a(Apartment)
    end
  end

  describe '#is_rented?' do
    it 'returns false initially to start as not rented' do
      expect(@apt_1.is_rented?).to be(false)
      expect(@apt_2.is_rented?).to be(false)
    end
  end

  describe '#rent' do
    it 'sets the @rent attribute to true after being rented' do
      expect(@apt_1.is_rented?).to be(false)
      expect(@apt_2.is_rented?).to be(false)
      @apt_1.rent
      @apt_2.rent
      expect(@apt_1.is_rented?).to be(true)
      expect(@apt_2.is_rented?).to be(true)
    end
  end

  describe '#rooms' do
    it 'returns an array' do
      expect(@apt_1.rooms).to be_a(Array)
      expect(@apt_2.rooms).to be_a(Array)
    end

    it 'starts empty' do
      expect(@apt_1.rooms.empty?).to be(true)
      expect(@apt_2.rooms.empty?).to be(true)
    end

    it 'returns an array of rooms' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_2.add_room(@room_4)
      @apt_2.add_room(@room_5)
      expect(@apt_1.rooms.all? { |room| room.is_a?(Room)}).to be(true)
      expect(@apt_2.rooms.all? { |room| room.is_a?(Room)}).to be(true)
    end
  end

  describe '#add_room' do
    it 'adds one room' do
      @apt_1.add_room(@room_1)
      @apt_2.add_room(@room_2)
      expect(@apt_1.rooms.count).to be(1)
      expect(@apt_2.rooms.count).to be(1)
    end

    it 'can add one room multiple times' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_2.add_room(@room_4)
      @apt_2.add_room(@room_5)
      expect(@apt_1.rooms.count).to be(3)
      expect(@apt_2.rooms.count).to be(2)
    end

    it 'adds the correct rooms' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_2.add_room(@room_4)
      @apt_2.add_room(@room_5)
      expect(@apt_1.rooms).to eq([@room_1, @room_2, @room_3])
      expect(@apt_2.rooms).to eq([@room_4, @room_5])
    end

    it 'cannot add more than four rooms' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_1.add_room(@room_4)
      @apt_1.add_room(@room_5)
      expect(@apt_1.rooms.count).to be(4)
      expect(@apt_1.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
    end
  end

  describe '#list_rooms_by_name_alphabetically' do
    it 'sorts the rooms alphabetically' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_1.add_room(@room_4)
      expect(@apt_1.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
      expect(@apt_1.list_rooms_by_name_alphabetically)
      .to eq([@room_1, @room_4, @room_3, @room_2])
    end

    it 'sorts the rooms alphabetically again' do
      @apt_1.add_room(@room_5)
      @apt_1.add_room(@room_3)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_4)
      expect(@apt_1.rooms).to eq([@room_5, @room_3, @room_2, @room_4])
      expect(@apt_1.list_rooms_by_name_alphabetically)
      .to eq([@room_4, @room_3, @room_2, @room_5])
    end

    it 'does not mutate the rooms array' do
      @apt_1.add_room(@room_1)
      @apt_1.add_room(@room_2)
      @apt_1.add_room(@room_3)
      @apt_1.add_room(@room_4)
      expect(@apt_1.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
      expect(@apt_1.list_rooms_by_name_alphabetically)
      .to eq([@room_1, @room_4, @room_3, @room_2])
      expect(@apt_1.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
    end
  end
end
