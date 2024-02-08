require './lib/grubhub_order'

RSpec.describe GrubhubOrder do
  before :each do
    @order = GrubhubOrder.new("food", "45-60 minutes")
  end

  it 'exists' do
    expect(@order).to be_a(GrubhubOrder)
  end

  it 'can return a confirmation message' do
    expect(@order.confirmation("way too much chinese takeout for one person")).to eq("You got way too much chinese takeout for one person.") #no judgment
  end

  it 'can return a delivery message' do
    expect(@order.delivery).to eq("Your food will arrive in 45-60 minutes.")
  end

  it 'can return a review request' do
    expect(@order.review).to eq("Please rate your order within 30 days.")
  end
end
