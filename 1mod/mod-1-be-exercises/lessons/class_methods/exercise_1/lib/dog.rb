#require 'barkable'
require 'pry'

class Dog
  #include Barkable

  attr_reader :name, :number_of_woofs
  def initialize(name)
    @name = name
    @number_of_woofs = 0
    #binding.pry ## What will the @name property be?
  end

  def bark
    #binding.pry ## What will be output here?
    "#{@name} goes Bark!"
  end

  def woof
    #binding.pry ## When calling .woof on a Dog class, will this pry be hit?
    "Woof!"
    @number_of_woofs += 1
  end

  def self.woof
    "Self woof!"
    #binding.pry ## Can we call @number_of_woofs inside this class method? Why or why not?
  end

end