=begin
1. Break the problem down fully before writing any code.
This includes writing down inputs and outputs, examples,
edge cases, diagrams, and possibly also pseudocode.
2. Ask clarifying questions early and often.
3. After coding, review it, check for bugs, optimize,
and ask if they want you to write tests as well if there
is time.

Pseudo code

Brute force approach
1. Declare two local variables and assign them each to 999
2. Multiply the two variables together and check if they are a palindrome
3. Call a is_palindrome method and pass in the product of the two variables
4. If the product is a palindrome, return the product
5. If the product is not a palindrome, decrement the first variable by 1 and multiply it by the second variable and check if it is a palindrome
6. If the product is still not palindrome, check to see which product is greater after decrementing each variable by 1
7. decrement the second variable by 1 and multiply it by the first variable and check if it is a palindrome
8. Repeat steps 5 through 7 until the product is a palindrome
=end

# def largest_integer_palindrome_from_product_of_two_three_digit_integers
#   int_1 = 999
#   int_2 = 999
#   max_product = 0

#   while int_1 > 0
#     while int_2 > 0
#       int_2 -= 1
#       if is_palindrome(int_1 * int_2)
#         max_product = int_1 * int_2 if int_1 * int_2 > max_product
#       end
#     end
#     int_1 -= 1
#   end
#   max_product
# end

def is_palindrome(integer)
  integer.to_s == integer.to_s.reverse
end

def largest_integer_palindrome_from_product_of_two_three_digit_integers
  999.times.map do |n|
    999.times.map do |m|
      n * m
    end
  end.flatten.filter do |n|
    is_palindrome(n)
  end.max
end
