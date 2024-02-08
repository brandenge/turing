class Market < ApplicationRecord
  has_many :market_vendors, dependent: :destroy
  has_many :vendors, -> { distinct }, through: :market_vendors

  validates_presence_of :name,
                        :state

  # def self.search_params_are_valid?(name, city, state)
  #   ( city && state.nil? && name.nil? ||
  #     city && name && state.nil? ) ? false : true
  # end

  def self.search(name, city, state)
    case
    when name.nil? && city.nil?
      where("state ILIKE '%#{state}%'")
    when name.nil?
      where("state ILIKE '%#{state}%'").where("city ILIKE '%#{city}%'")
    when city.nil? && state.nil?
      where("name ILIKE '%#{name}%'")
    when city.nil?
      where("state ILIKE '%#{state}%'").where("name ILIKE '%#{name}%'")
    else
      where("state ILIKE '%#{state}%'").where("city ILIKE '%#{city}%'").where("name ILIKE '%#{name}%'")
    end
  end

  def vendor_count
    vendors.count
  end

  def vendors_by_market_vendor_id
    Vendor.joins(:market_vendors).where('market_vendors.market_id': id).order('market_vendors.id')
  end
end
