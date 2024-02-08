class ResidentCourse < ApplicationRecord
  belongs_to :resident
  belongs_to :course
end
