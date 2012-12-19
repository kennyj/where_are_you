require 'test_helper'

class LocationTest < ActiveSupport::TestCase 
  setup do
    @location = Location.new(name: "test", lat: 1.0, lng: 2.0)
  end

  test "name is not null" do
    check @location, :name, nil
  end

  test "name is uniqueness" do
    check @location, :name, "osaka"
  end

  test "status is CODED if lat/lng are assigned" do
    @location.save
    assert Location::CODED, @location.status
  end

  test "status is UNCODED if lat/lng aren't assigned" do
    @location.lat = @location.lng = nil
    @location.save
    assert Location::UNCODED, @location.status
  end
end
