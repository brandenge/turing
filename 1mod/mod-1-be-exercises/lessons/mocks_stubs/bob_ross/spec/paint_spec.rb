require 'rspec'
require './lib/paint'

RSpec.describe Paint do
  describe 'Instantiation' do
    it 'exists' do
      paint1 = Paint.new("Alizarin Crimson")
      paint2 = Paint.new("Van Dyke Brown", 65)

      expect(paint1).to be_an_instance_of(Paint)
      expect(paint2).to be_an_instance_of(Paint)
    end

    it 'has attributes' do
      paint1 = Paint.new("Alizarin Crimson")
      paint2 = Paint.new("Van Dyke Brown", 25)

      expect(paint1.color).to eq("Alizarin Crimson")
      expect(paint1.amount).to eq(0)
      expect(paint2.amount).to eq(25)
    end
  end
end
