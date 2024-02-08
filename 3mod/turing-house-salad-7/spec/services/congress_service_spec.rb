require 'rails_helper'

describe CongressService do
  context "class methods" do
    context "#members_by_state" do
      it "returns member data" do
        json_response = File.read('spec/fixtures/co_members_of_the_house.json')
        stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json")
        .to_return(status: 200, body: json_response, headers: {})

        search = CongressService.new.members_by_state("CO")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        member_data = search[:results].first

        expect(member_data).to have_key :name
        expect(member_data[:name]).to be_a(String)

        expect(member_data).to have_key :role
        expect(member_data[:role]).to be_a(String)

        expect(member_data).to have_key :district
        expect(member_data[:district]).to be_a(String)

        expect(member_data).to have_key :party
        expect(member_data[:party]).to be_a(String)
      end
    end
  end
end
