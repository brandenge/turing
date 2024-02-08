# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './spec/fixtures/supermarket_data'
require './spec/fixtures/item_data'
require './spec/fixtures/customer_data'

include SupermarketData
include ItemData
include CustomerData

@supermarket_1 = Supermarket.create!(SUPERMARKET_1)
@supermarket_2 = Supermarket.create!(SUPERMARKET_2)
@supermarket_3 = Supermarket.create!(SUPERMARKET_3)

@item_1 = @supermarket_1.items.create!(ITEM_1)
@item_2 = @supermarket_1.items.create!(ITEM_2)
@item_3 = @supermarket_2.items.create!(ITEM_3)
@item_4 = @supermarket_2.items.create!(ITEM_4)
@item_5 = @supermarket_3.items.create!(ITEM_5)

@customer_1 = Customer.create!(CUSTOMER_1)
@customer_2 = Customer.create!(CUSTOMER_2)
@customer_3 = Customer.create!(CUSTOMER_3)
@customer_4 = Customer.create!(CUSTOMER_4)
@customer_5 = Customer.create!(CUSTOMER_5)

@customer_item_1 = CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
@customer_item_2 = CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
@customer_item_3 = CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_2.id)
@customer_item_4 = CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_2.id)
@customer_item_5 = CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_3.id)
@customer_item_6 = CustomerItem.create!(item_id: @item_4.id, customer_id: @customer_3.id)
@customer_item_7 = CustomerItem.create!(item_id: @item_4.id, customer_id: @customer_4.id)
@customer_item_8 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_4.id)
@customer_item_9 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_5.id)
@customer_item_10 = CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_5.id)
@customer_item_11 = CustomerItem.create!(item_id: @item_5.id, customer_id: @customer_3.id)
