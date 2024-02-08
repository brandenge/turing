module TestData
  REGISTRANT_1 = {
    name: 'Bruce',
    age: 18,
    permit: true
  }.freeze
  REGISTRANT_2 = {
    name: 'Penny',
    age: 16
  }.freeze
  REGISTRANT_3 = {
    name: 'Tucker',
    age: 15
  }.freeze

  CRUZ = {
    vin: '123456789abcdefgh',
    year: 2012,
    make: 'Chevrolet',
    model: 'Cruz',
    engine: :ice
  }.freeze
  BOLT = {
    vin: '987654321abcdefgh',
    year: 2019,
    make: 'Chevrolet',
    model: 'Bolt',
    engine: :ev
  }.freeze
  CAMARO = {
    vin: '1a2b3c4d5e6f',
    year: 1969,
    make: 'Chevrolet',
    model: 'Camaro',
    engine: :ice
  }.freeze

  FACILITY_1 = {
    name: 'Albany DMV Office',
    address: '2242 Santiam Hwy SE Albany OR 97321',
    phone: '541-967-2014'
  }.freeze
  FACILITY_2 = {
    name: 'Ashland DMV Office',
    address: '600 Tolman Creek Rd Ashland OR 97520',
    phone: '541-776-6092'
  }.freeze
  FACILITY_3 = {
    name: 'Bend DMV Office',
    address: '63030 O B Riley Rd Bend OR 97701',
    phone: '541-388-6322'
  }.freeze

  WA_EV_VEHICLE_1 = {
    vin: 'JTMEB3FV7M',
    year: '2021',
    make: 'TOYOTA',
    model: 'RAV4 Prime',
    engine: :ev
  }.freeze
  WA_EV_VEHICLE_2 = {
    vin: 'KNDCC3LD6K',
    year: '2019',
    make: 'KIA',
    model: 'Niro',
    engine: :ev
  }.freeze
  NY_VEHICLE_1 = {
    vin: '999999999999',
    year: '1975',
    make: 'STARC',
    model: nil,
    engine: :ice
  }.freeze
  NY_VEHICLE_2 = {
    vin: '9811240',
    year: '1998',
    make: 'AR/CA',
    model: nil,
    engine: :ice
  }.freeze

  OR_FACILITY_1 = {
    name: 'ALBANY DMV OFFICE',
    address: '2242 SANTIAM HWY SE ALBANY OR 97321',
    phone: '5419672014'
  }.freeze
  OR_FACILITY_2 = {
    name: 'LA PINE DMV OFFICE',
    address: '51515 HUNTINGTON RD LA PINE OR 97739',
    phone: '5413886322'
  }.freeze
  NY_FACILITY_1 = {
    name: 'JAMESTOWN',
    address: '512 WEST 3RD STREET JAMESTOWN NY 14701',
    phone: '7166618220'
  }.freeze
  NY_FACILITY_2 = {
    name: 'MOHAWK WELCOME CENTER KIOSK',
    address: 'I90 WESTBOUND MILEPOST187 MOHAWK VALLEY WELCOME CTR FULTONVILLE NY 12072',
    phone: nil
  }.freeze
  MO_FACILITY_1 = {
    name: 'SAINTE GENEVIEVE',
    address: '753 STE. GENEVIEVE DR STE GENEVIEVE MO 63670',
    phone: '5738832344'
  }.freeze
  MO_FACILITY_2 = {
    name: 'SAINT CLAIR',
    address: '960 PLAZA DR, SUITE H ST CLAIR MO 63077',
    phone: '6366296000'
  }.freeze
end
