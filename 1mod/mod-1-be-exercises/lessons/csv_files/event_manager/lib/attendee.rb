class Attendee
  attr_reader :id,
              :name,
              :zipcode

  def initialize(id, first, last, zipcode)
    @id = id
    @name = "#{first} #{last}"
    @zipcode = clean_zipcode(zipcode)
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end
end
