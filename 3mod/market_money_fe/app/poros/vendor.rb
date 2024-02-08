class Vendor
  attr_reader :id,
              :name,
              :description,
              :contact_name,
              :contact_phone,
              :credit_accepted

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @description = data[:description]
    @contact_name = data[:contact_name]
    @contact_phone = data[:contact_phone]
    @credit_accepted = data[:credit_accepted]
  end
end
