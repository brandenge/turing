class MapFacade
  def get_city_lat_lng(location)
    service.get_city_lat_lng(location)
  end

  def get_route(origin, destination)
    service.get_route(origin, destination)
  end

  private

  def service
    @_service ||= MapQuestService.new
  end
end
