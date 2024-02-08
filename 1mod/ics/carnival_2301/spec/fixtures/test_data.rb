module TestData
  VISITOR1 = {
    name: 'Bruce',
    height: 54,
    spending_money: '$10'
  }.freeze

  VISITOR2 = {
    name: 'Tucker',
    height: 36,
    spending_money: '$5'
  }.freeze

  VISITOR3 = {
    name: 'Penny',
    height: 64,
    spending_money: '$15'
  }.freeze

  RIDE1 = {
    name: 'Carousel',
    min_height: 24,
    admission_fee: 1,
    excitement: :gentle
  }.freeze

  RIDE2 = {
    name: 'Ferris Wheel',
    min_height: 36,
    admission_fee: 5,
    excitement: :gentle
  }.freeze

  RIDE3 = {
    name: 'Roller Coaster',
    min_height: 54,
    admission_fee: 2,
    excitement: :thrilling
  }.freeze

  CARNIVAL1 = {
    duration: '3 days'
  }.freeze

  CARNIVAL2 = {
    duration: '3 days'
  }.freeze
end
