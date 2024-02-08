module CarnivalTestMethods
  def all
    self.class_variable_get(:@@carnivals)
  end

  def reset
    self.class_variable_set(:@@carnivals, [])
  end
end
