class ActivitiesFacade
  def get_activities_for_weather(temperature)
    service.get_activities_for_weather(temperature)
  end

  private

  def service
    @_service ||= BoredApiService.new
  end
end
