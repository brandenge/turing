class SearchFacade
  def initialize(state)
    @state = state
  end

  def members
    service = CongressService.new

    json = service.members_by_state(@state)
    
    @members = json[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end