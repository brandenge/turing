# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './spec/fixtures/course_data'
require './spec/fixtures/resident_data'

include CourseData
include ResidentData

ResidentCourse.destroy_all
Resident.destroy_all
Course.destroy_all

@course_1 = Course.create!(CRIME_SCENES)
@course_2 = Course.create!(FINGERPRINTING)

@resident_1 = @course_2.residents.create!(JESSICA)
@resident_2 = @course_2.residents.create!(SETH)
@resident_3 = @course_2.residents.create!(AMOS)
@resident_4 = @course_2.residents.create!(JOE)
@resident_5 = @course_2.residents.create!(BOB)
@resident_6 = @course_2.residents.create!(AMY)
@resident_7 = @course_2.residents.create!(AL)
@resident_8 = @course_2.residents.create!(LIV)
@resident_9 = @course_2.residents.create!(TOM)
@resident_10 = @course_2.residents.create!(RAY)

ResidentCourse.create!(course_id: @course_1.id, resident_id: @resident_1.id)
ResidentCourse.create!(course_id: @course_1.id, resident_id: @resident_2.id)
ResidentCourse.create!(course_id: @course_1.id, resident_id: @resident_3.id)
ResidentCourse.create!(course_id: @course_1.id, resident_id: @resident_4.id)
ResidentCourse.create!(course_id: @course_1.id, resident_id: @resident_5.id)
