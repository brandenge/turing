class Student
  attr_reader :name, :cookies

  def initialize(name)
    @name = name
    @cookies = []
  end

  def add_cookie(cookie)
    @cookies << cookie
  end
end
