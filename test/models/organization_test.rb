require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  setup do
    @org = Organization.new login: "foo", github_id: "9" * 11, type: "Organization"
  end

  test "login is not null" do
    check @org, :login, nil
  end

  test "github_id is not null" do
    check @org, :github_id, nil
  end

  test "type is not null" do
    check @org, :type, nil
  end

  test "login is uniqueness" do
    check @org, :login, "rails"
  end

  test "github_id is uniqueness" do
    check @org, :github_id, 13426
  end

  test "organization hasn't many contributors" do
    assert !@org.respond_to?(:contributors)
  end
end
