require "./lib/shape"

#Unskip the tests one-by-one, then edit the Shape class so that each test passes.
RSpec.describe Shape do
  xit "exists" do
    s = Shape.new("red", 2, 4)
  end

  xit "has color, length, and width attributes" do
    s = Shape.new("red", 2, 4)
    expect(s.color).to eq('red')
    expect(s.length).to eq(2)
    expect(s.width).to eq(4)
  end

  xit "can calculate area" do
    s = Shape.new("red", 2, 4)
    expect(s.area).to eq(8)
  end

  xit "can calculate perimeter" do
    s = Shape.new("red", 2, 4)
    expect(s.perimeter).to eq(12)
  end
end