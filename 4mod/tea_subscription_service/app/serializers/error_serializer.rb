class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialize_json
    {
      errors: [
        {
          detail: @error.message
        }
      ]
    }
  end
end
