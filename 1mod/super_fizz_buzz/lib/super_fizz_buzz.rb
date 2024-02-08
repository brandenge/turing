class SuperFizzBuzz
  def output(n)
    result = ''
    super_fizz = { 'Super' => 7, 'Fizz' => 3, 'Buzz' => 5 }
    super_fizz.each { |k, v| result += k if (n % v).zero? }
    result.empty? ? n : result
  end

  def output_range(first, last)
    (first..last).map{ |n| output(n) }
  end
end
