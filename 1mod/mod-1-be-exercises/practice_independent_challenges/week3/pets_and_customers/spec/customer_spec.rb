require 'spec_helper'

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new(*CUSTOMER_1.values)
    @amy = Customer.new(*CUSTOMER_2.values)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@joel).to be_instance_of(Customer)
      expect(@amy).to be_instance_of(Customer)
    end
  end

  describe '#name, #id' do
    it 'has attributes' do
      expect(@joel.name).to eq('Joel')
      expect(@joel.id).to eq(2)
    end

    it 'has different attributes' do
      expect(@amy.name).to eq('Amy')
      expect(@amy.id).to eq(3)
    end
  end

  describe '#pets' do
    it 'starts with no pets' do
      expect(@joel.pets).to eq([])
      expect(@amy.pets).to eq([])
    end
  end

  describe '#outstanding_balance' do
    it 'starts with no outstanding balance' do
      expect(@joel.outstanding_balance).to eq(0)
      expect(@amy.outstanding_balance).to eq(0)
    end
  end

  describe '#adopt' do
    it 'can adopt new pets' do
      samson = Pet.new(PET_1)
      lucy = Pet.new(PET_2)

      @joel.adopt(samson)
      @joel.adopt(lucy)
      expect(@joel.pets).to eq([samson, lucy])
    end
  end

  describe '#charge' do
    it 'can charge to increase oustanding balance' do
      @joel.charge(15)
      @joel.charge(7)

      expect(@joel.outstanding_balance).to eq(22)
    end
  end
end
