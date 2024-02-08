require 'rspec'

def format_price(price)
  '$%05.2f' % price.delete('$')
end

RSpec.describe 'format_price, which formats prices in $##.## format' do
  it 'pads 0 to the front of the price' do
    expect(format_price('$2.50')).to eq('$02.50')
  end

  it 'pads 0 to the end of the price' do
    expect(format_price('$2.5')).to eq('$02.50')
  end

  it 'removes $ at the end of the price' do
    expect(format_price('$32.25$')).to eq('$32.25')
  end

  it 'removes $ in the middle of the price' do
    expect(format_price('3$.25')).to eq('$03.25')
    expect(format_price('9.$50')).to eq('$09.50')
  end

  it 'adds $ to the start of the price' do
    expect(format_price('75.98')).to eq('$75.98')
  end

  it 'formats prices $100 and above correctly' do
    expect(format_price('$143.50')).to eq('$143.50')
  end
end

# This is called a format string. The relevant documentation on it in Ruby is under the sprintf method. Format strings and sprintf were originally a powerful feature of the C programming language, and many other languages have implemented it as well. So it is useful to know.

# The way it works is you make a string, and then use a format sequence inside of it, which starts with %. The format string is followed by a % and then additional arguments, which will be transformed and interpolated per the format sequence(s) in the format string. If more than one format sequence and arguments are used, the arguments go in an array and are positional - they match to their respective format sequences in the same order. Although it behaves like string interpolation, single quotes for the format string works too still.

# The syntax (per the docs) is %[flags][width][.precision]type % arguments
# Breaking down my example:

# '$%05.2f' is the format string
# %05.2f is the format sequence within it
# price.delete('$') is the argument that gets matched to and transformed by the format sequence

# Breaking the entire format sequence down character by character:

# % - starts the format sequence
# 0 - this is a flag that tells it to pad the front of the string with 0s
# 5 - this is the width (i.e. the number of characters in/length of the string). It will pad the interpolated arguments until they are at least this width. Longer widths are fine, they are not truncated.
# . - this represents the decimal point of a float
# 2 - this is the number of decimal places we keep. If too few, it pads it with 0's at the end. If too many, it performs a rounding operation, not truncation.
# f - this is the type. It signifies a float. Other common examples are s for a string and d for an integer.

# The % after the format string is just a delimiter between the format string and its arguments. After this is the arguments.

# Some other common quick simple examples, %02d with the argument '1' would return '01', and %.2f with the argument '5.23398' would return '5.23'. Note that it performs the integer or float conversion for you.
