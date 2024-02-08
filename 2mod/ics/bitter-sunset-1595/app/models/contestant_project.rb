class ContestantProject < ApplicationRecord
  belongs_to :project
  belongs_to :contestant
end
