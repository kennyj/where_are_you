require 'test_helper'

class LocationTest < ActiveSupport::TestCase 
  setup do
    @location = Location.new(name: "test", lat: 1.0, lng: 2.0)
  end

  test "name is not null" do
    @location.name = nil
    assert !@location.valid?
    assert_equal 1,  @location.errors.size
  end

  test "lat is not null" do
    @location.lat = nil
    assert !@location.valid?
    assert_equal 1,  @location.errors.size
  end

  test "lng is not null" do
    @location.lng = nil
    assert !@location.valid?
    assert_equal 1,  @location.errors.size
  end

  test "name is uniqueness" do
    @location.name = "osaka"
    assert !@location.valid?
    assert_equal 1,  @location.errors.size
  end

  test "has many users" do
    assert @location.users.empty?
  end

end
