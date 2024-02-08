module ApplicationHelper
  def format_price(item)
    sprintf('$%.2f', item.price)
  end
end
