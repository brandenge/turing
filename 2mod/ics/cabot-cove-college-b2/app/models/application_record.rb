class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_by_name
    order(:name)
  end
end
