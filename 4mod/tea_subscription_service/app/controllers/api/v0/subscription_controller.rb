class Api::V0::SubscriptionController < ApplicationController
  def index
    subscriptions = Subscription.all

    render json: SubscriptionSerializer.new(subscriptions).serializable_hash.to_json, status: 200
  end

  def create
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionSerializer.new(subscription).serializable_hash.to_json, status: 200
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update({status: 'Cancelled'})
    render json: SubscriptionSerializer.new(subscription).serializable_hash.to_json, status: 200
  end

  private

  def record_not_found
    render json: { errors: "Not found" }, status: 404
  end

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end
