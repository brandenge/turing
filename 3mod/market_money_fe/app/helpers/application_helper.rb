module ApplicationHelper
  def successful_search_message(search_results)
    "#{search_results[:markets].size} Search Results for #{search_results[:search_params].map{ |param| param.join('=') }.join(' and ')}:"
  end
end
