class Challenge < ApplicationRecord
  validates_presence_of :theme, :project_budget
  has_many :projects
end
