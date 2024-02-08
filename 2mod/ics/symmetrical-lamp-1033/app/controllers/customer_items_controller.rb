class CustomerItemsController < ApplicationController
  def create
    CustomerItem.create(customer_id: params[:'Customer id'], item_id: params[:'Item id'])
    redirect_to customer_path(params[:'Customer id'])
  end
end
