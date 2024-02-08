names = ['Joe', 'Bob', 'Tom', 'Tim']
ages = [20, 34, 51, 29]
prices = [2.34, 55.32, 76.23, 12.68]
is_logged_in = [true, false, false, true]

# The Array#pop method mutates the array by removing the last element from the array
# It also returns the removed element
# If given an integer argument, it will remove and return that many elements from the end
names.pop
p names

# The Array#push method is the opposite of the Array#pop method
# It mutates an array by adding elements to it, and returns array
ages.push(43)
p ages

# The Array#shift method is similar to Array#pop, but removes and returns elements
# from the start of the array, rather than from the end
prices.shift
p prices

# The Array#unshift method is similar to Array#push, but adds elements
# to the start of the array, rather than from the end
is_logged_in.unshift(false)
p is_logged_in

=begin
Index Positions

- Index positions are like the numerical address of each element of an array
- Index positions start counting from 0 for the first element of the array
- This means that the index of the last element of the array is always at the array's length minus 1
- Square brackets are used after the array name to access its index
- Anything inside of the square brackets will be evaluated as a Ruby expression
- This allows variables, mathematical equations, and even methods to be used inside of the square brackets - anything that will evaluate to a number
- If a floating point number is used inside of square brackets, it will be converted to an integer by truncating everything after the decimal point
- Any non-numeric value inside of the square brackets will throw a TypeError as it will not be automatically converted to a number by Ruby

New Array Method - count

- The Array#count method returns the number of elements in the array
- So without an argument, it is basically equivalent to calling .length on the array
- It also accepts arguments, such as a value or a block
- If given an argument, it acts very much like the Array#filter method, but with .length called on it

=end
