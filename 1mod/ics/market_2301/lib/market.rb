require 'date'

class Market
  attr_reader :name,
              :vendors,
              :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.inventory[item] > 0 }
  end

  def sorted_item_list
    @vendors.map do |vendor|
      vendor.inventory.map { |item, _| item.name }
    end.flatten.uniq.sort
  end

  def items
    @vendors.map { |vendor| vendor.inventory.keys }.flatten.uniq
  end

  def check_stock(item)
    vendors_that_sell(item).reduce(0) do |sum, vendor|
      sum + vendor.check_stock(item)
    end
  end

  def total_inventory
    items.map do |item|
      item_info = {
        quantity: check_stock(item),
        vendors: vendors_that_sell(item)
      }
      [item, item_info]
    end.to_h
  end

  def overstocked_items
    items.select do |item|
      total_inventory[item][:quantity] > 50 &&
      total_inventory[item][:vendors].count > 1
    end
  end

  def sell(item, quantity)
    return false if total_inventory[item][:quantity] < quantity
    @vendors.each do |vendor|
      if vendor.inventory[item] - quantity >= 0
        vendor.inventory[item] -= quantity
        break
      else
        quantity -= vendor.inventory[item]
        vendor.inventory[item] = 0
      end
    end
    true
  end
end
