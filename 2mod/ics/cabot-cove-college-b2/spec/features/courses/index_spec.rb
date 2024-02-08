require 'rails_helper'

RSpec.describe 'Courses Index Page', type: :feature do
  before(:each) do
    visit '/courses'
  end

  it 'shows all of the courses and the number of residents enrolled in the course' do
    Course.all.each do |course|
      expect(page).to have_content("#{course.name}: #{course.residents.count}")
    end
  end

  it 'has a link to each course\'s show page' do
    Course.all.each do |course|
      visit '/courses'

      click_link(course.name)

      expect(current_path).to eq("/courses/#{course.id}")
    end
  end

  it 'orders the courses alphabetically by name' do
    expect(@course_1.name).to appear_before(@course_2.name)
  end

  it 'orders the residents of each course alphabetically by name' do
    expect(@resident_3.name).to appear_before(@resident_5.name)
    expect(@resident_5.name).to appear_before(@resident_2.name)
    expect(@resident_2.name).to appear_before(@resident_1.name)
    expect(@resident_1.name).to appear_before(@resident_4.name)
  end
end
