class Member
  attr_reader :name,
              :role,
              :party,
              :district

  def initialize(attributes)
    @name       = attributes[:name]
    @role       = attributes[:role]
    @party      = attributes[:party]
    @district   = attributes[:district]
  end
end