class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    revenue_per_item = @inventory.map do |stock_item, amount|
      stock_item.price.delete("$").to_f * amount
    end
    revenue_per_item.sum
  end
end
