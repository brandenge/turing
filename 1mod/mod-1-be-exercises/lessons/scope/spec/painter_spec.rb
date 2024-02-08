require './lib/painter'
require './lib/paint'

describe Painter do
  it 'test_it_exists' do
    the_painters_name = "Bob Ross"
    painter = Painter.new(the_painters_name)

    expect(painter).to be_a(Painter)
  end

  xit 'test_it_has_a_name1' do
    painter = Painter.new(the_painters_name)

    expect(painter.name).to eq("Bob Ross")
  end

  xit 'test_it_has_a_name2' do
    painter = Painter.new("Bob Ross")

    expect(@name).to eq("Bob Ross")
  end

  xit 'test_it_has_a_name3' do
    bob_ross = Painter.new("Bob Ross")

    expect(painter.name).to eq("Bob Ross")
  end

  xit 'test_it_can_give_greeting' do
    painter = Painter.new("Bob Ross")

    expect(greeting).to eq("Hello, I'm Bob Ross")
  end

  xit 'test_it_can_give_greeting_again' do
    painter = Painter.new("Bob Ross")

    expect(painter.greeting).to eq("Hello, I'm Bob Ross")
  end

  xit 'test_it_starts_with_no_paint' do
    painter = Painter.new("Bob Ross")

    expect(painter.paints).to eq([])
  end

  xit 'test_it_can_add_all_paints' do
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_all_paints

    expect(painter.get_paints).to eq([paint_1, paint_2])
  end

  xit 'test_it_can_add_paints' do
    painter = Painter.new("Bob Ross")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)

    expect(painter.get_paints).to eq([paint_1, paint_2])
  end

  xit 'test_it_can_add_paints_again' do
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)

    expect(painter.get_paints).to eq([paint_1, paint_2])
  end

  xit 'test_it_can_add_paints_third_try' do
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint)
    painter.add_paint(paint)

    expect(painter.get_paints).to eq([paint_1, paint_2])
  end

  xit 'test_it_can_get_paint_names' do
    painter = Painter.new("Bob Ross")
    paint_1 = Paint.new("Alizarin Crimson")
    paint_2 = Paint.new("Van Dyke Brown")
    painter.add_paint(paint_1)
    painter.add_paint(paint_2)

    expected = ["Alizarin Crimson", "Van Dyke Brown"]
    expect(painter.get_paints).to eq(expected)
  end
end
