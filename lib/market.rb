class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    vendor_inventories = @vendors.map do |vendor|
      vendor.inventory
    end
    vendor_items = vendor_inventories.map do |vendor|
      vendor.keys
    end
    item_names = vendor_items.map do |item|

      item.name
    end
  end


end
