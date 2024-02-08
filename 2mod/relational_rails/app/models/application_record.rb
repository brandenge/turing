class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_by_created_at
    order(:created_at)
  end

  def self.exact_match_name(name)
    where('name ILIKE ?', "#{name}")
  end

  def self.search_name(name)
    where('name ILIKE ?', "%#{name}%")
  end
end
