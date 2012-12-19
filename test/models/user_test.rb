require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new login: "foo", github_id: "9" * 11, type: "User",
                     name: "Foo", email: "foo@bar.com"
  end

  test "login is not null" do
    check @user, :login, nil
  end

  test "github_id is not null" do
    check @user, :github_id, nil
  end

  test "type is not null" do
    check @user, :type, nil
  end

  test "login is uniqueness" do
    check @user, :login, "kennyj"
  end

  test "github_id is uniqueness" do
    check @user, :github_id, 13426
  end

  test "user has many contributors" do
    assert @user.contributors.empty?
  end

  test "create from api" do
    user = User.create_or_update_from_api("fukajun")
    assert user.persisted?
    assert_equal "fukajun", user.login
  end

  test "update from api" do
    user = User.create_or_update_from_api("kennyj")
    assert user.persisted?
    assert_equal "kennyj", user.login
  end

  test "invalid user" do
    assert_raise(ActiveRecord::RecordNotFound) { User.create_or_update_from_api("yyyxxx") }
  end

  test "location" do
    user = User.create_or_update_from_api("kennyj")
    assert user.location.is_a?(Location)
  end
end
