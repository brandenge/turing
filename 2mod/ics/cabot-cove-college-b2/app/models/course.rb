class Course < ApplicationRecord
  validates_presence_of :name

  has_many :resident_courses
  has_many :residents, through: :resident_courses

  def residents_sorted_by_name
    Resident.joins(:resident_courses).where('resident_courses.course_id': self.id).order(:name)
  end
end
