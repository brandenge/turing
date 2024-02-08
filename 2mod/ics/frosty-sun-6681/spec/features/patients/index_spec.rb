require 'rails_helper'

RSpec.describe 'Patients Index Page', type: :feature do
  before(:each) do
    visit patients_path
  end

  it 'has headers' do
    expect(page).to have_content('Patients Index')
  end

  it 'only shows patients with age greater than or equal to 18' do
    Patient.adults.each do |patient|
      expect(page).to have_content(patient.name)
    end
    expect(page).to_not have_content(@child_patient.name)
  end

  it 'shows the patients names in alphabetical order' do
    expect(@patient12.name).to appear_before(@patient6.name)
    expect(@patient6.name).to appear_before(@patient1.name)
    expect(@patient1.name).to appear_before(@patient4.name)
    expect(@patient4.name).to appear_before(@patient7.name)
    expect(@patient7.name).to appear_before(@patient8.name)
    expect(@patient8.name).to appear_before(@patient3.name)
    expect(@patient3.name).to appear_before(@patient14.name)
    expect(@patient14.name).to appear_before(@patient13.name)
    expect(@patient13.name).to appear_before(@patient9.name)
    expect(@patient9.name).to appear_before(@patient2.name)
    expect(@patient2.name).to appear_before(@patient5.name)
    expect(@patient5.name).to appear_before(@patient11.name)
    expect(@patient11.name).to appear_before(@patient10.name)
  end
end
