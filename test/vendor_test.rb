require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")

  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
    expected = {}
    assert_equal expected, vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 30)
    assert_equal 30, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_item
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

    @vendor.stock(@item1, 30)
    expected = {@item1 => 30}

    assert_equal expected, @vendor.inventory
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)

    expected = {@item1 => 55, @item2 => 12}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_calculate_potent_revenue
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @vendor.stock(@item1, 30)

    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor.stock(@item2, 12)
    assert_equal 28.50, @vendor.potential_revenue
  end
end
# pry(main)> vendor1.potential_revenue
# #=> 29.75
#
# pry(main)> vendor2.potential_revenue
# #=> 345.00
#
# pry(main)> vendor3.potential_revenue
# #=> 48.75
#
