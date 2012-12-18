require 'test_helper'

class LocationTest < ActiveSupport::TestCase 
  setup do
    @location = Location.new(name: "test", lat: 1.0, lng: 2.0)
  end

  test "name is not null" do
    check @location, :name, nil
  end

  test "lat is not null" do
    check @location, :lat, nil
  end

  test "lng is not null" do
    check @location, :lng, nil
  end

  test "name is uniqueness" do
    check @location, :name, "osaka"
  end

  test "has many users" do
    skip
    assert @location.users.empty?
  end

end
