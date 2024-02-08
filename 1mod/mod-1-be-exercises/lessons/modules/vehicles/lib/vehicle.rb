require './lib/engine'
require './lib/air_conditionable'

module Vehicle
  include Engine
  include AirConditionable
end
