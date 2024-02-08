class Santa
  def initialize
    @cookies_eaten = 0
  end

  def fits?
    @cookies_eaten < 3
  end

  def eats_cookies
    @cookies_eaten += 1
  end
end
