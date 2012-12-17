require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(login: "foo", github_id: "9" * 11, type: "User",
                     name: "Foo", email: "foo@bar.com",
                     location_id: locations(:tokyo).id)
  end

  test "login is not null" do
    @user.login = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "github_id is not null" do
    @user.github_id = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "type is not null" do
    @user.type = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "name is not null" do
    @user.name = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "email is not null" do
    @user.email = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "location is not null" do
    @user.location = nil
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "login is uniqueness" do
    @user.login = "kennyj"
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "github_id is uniqueness" do
    @user.github_id = 13426
    assert !@user.valid?
    assert_equal 1, @user.errors.size
  end

  test "user belongs to location" do
    assert @user.location.is_a?(Location)
  end

  test "user has many contributors" do
    assert @user.contributors.empty?
  end

end
