require './lib/visitor'
require './lib/ride'
require './lib/carnival'

require './spec/fixtures/test_data'
include TestData

require './spec/fixtures/carnival_test_methods'

class Carnival
  extend CarnivalTestMethods
end
