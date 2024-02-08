require'spec_helper'

RSpec.describe FacilityFactory do
  it 'exists' do
    factory = FacilityFactory.new
    
    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  describe '#creating facility factory' do
    it 'creates facility instances from or_dmv_office_locations' do
      factory = FacilityFactory.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      or_facilities = factory.create_facilities(or_dmv_office_locations)

      expect(or_facilities[0].name).to eq(facility_1.name)
      expect(or_facilities[1].name).to eq(facility_2.name)
      expect(or_facilities[0].address).to eq(facility_1.address)
      expect(or_facilities[1].address).to eq(facility_2.address)
      expect(or_facilities[0].phone).to eq(facility_1.phone)
      expect(or_facilities[1].phone).to eq(facility_2.phone)
    end

    it 'creates facility instances from ny_dmv_office_locations' do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      facility_1 = Facility.new({name: 'JAMESTOWN', address: '512 WEST 3RD STREET JAMESTOWN NY 14701', phone: '7166618220' })
      facility_2 = Facility.new({name: 'SARATOGA SPRINGS - WILTON', address: '3065 ROUTE 50 WILTON MALL SARATOGA SPRINGS NY 12866', phone: '5185847403' })
      ny_facilities = factory.create_facilities(ny_dmv_office_locations)

      expect(ny_facilities[0].name).to eq(facility_1.name)
      expect(ny_facilities[1].name).to eq(facility_2.name)
      expect(ny_facilities[0].address).to eq(facility_1.address)
      expect(ny_facilities[1].address).to eq(facility_2.address)
      expect(ny_facilities[0].phone).to eq(facility_1.phone)
      expect(ny_facilities[1].phone).to eq(facility_2.phone)
    end 

    it 'creates facility instances from mo_dmv_office_locations' do
      factory = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      facility_1 = Facility.new({name: 'SAINTE GENEVIEVE', address: '753 STE. GENEVIEVE DR STE GENEVIEVE MO 63670', phone: '(573) 883-2344' })
      facility_2 = Facility.new({name: 'OAKVILLE', address: '3164 TELEGRAPH ROAD ST LOUIS MO 63125', phone: '(314) 887-1050' })
      mo_facilities = factory.create_facilities(mo_dmv_office_locations)

      expect(mo_facilities[0].name).to eq(facility_1.name)
      expect(mo_facilities[1].name).to eq(facility_2.name)
      expect(mo_facilities[0].address).to eq(facility_1.address)
      expect(mo_facilities[1].address).to eq(facility_2.address)
      expect(mo_facilities[0].phone).to eq(facility_1.phone)
      expect(mo_facilities[1].phone).to eq(facility_2.phone)

    end
  end

  describe '#concatenate facilities' do
    describe 'or_concatenate facility human_address' do
      it 'will concatenate the human address of the facility' do
        factory = FacilityFactory.new
        facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
        human_address = "{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"

        expect(factory.or_concatenate(human_address)).to eq(facility_1.address)
      end

    end

    describe 'ny_concatenate(address)' do
      it 'will concatenate ny facility for address' do
        factory = FacilityFactory.new
        address = {"office_name":"JAMESTOWN","office_type":"COUNTY OFFICE","public_phone_number":"7166618220","street_address_line_1":"512 WEST 3RD STREET","city":"JAMESTOWN","state":"NY","zip_code":"14701"}
        facility_1 = Facility.new({name: 'JAMESTOWN', address: '512 WEST 3RD STREET JAMESTOWN NY 14701', phone: '7166618220' })
        facility_2 = Facility.new({name: 'SARATOGA SPRINGS - WILTON', address: '3065 ROUTE 50 WILTON MALL SARATOGA SPRINGS NY 12866', phone: '5185847403' })

        expect(factory.ny_concatenate(address)).to eq(facility_1.address)
      end
    end

    describe 'mo_concatenate(address)' do
      it 'will concatenate mo facility for address' do
        factory = FacilityFactory.new
        address = {"number":"153","dorregionnumber":"10","type":"1MV","name":"SAINTE GENEVIEVE ","address1":"753 STE. GENEVIEVE DR","city":"STE GENEVIEVE ","state":"MO","zipcode":"63670","county":"Ste. Genevieve","phone":"(573) 883-2344"}
        facility_1 = Facility.new({name: 'SAINTE GENEVIEVE', address: '753 STE. GENEVIEVE DR STE GENEVIEVE MO 63670', phone: '(573) 883-2344' })
        facility_2 = Facility.new({name: 'OAKVILLE', address: '3164 TELEGRAPH ROAD ST LOUIS MO 63125', phone: '(314) 887-1050' })
        
        expect(factory.mo_concatenate(address)).to eq(facility_1.address)
      end
    end
  end  
end