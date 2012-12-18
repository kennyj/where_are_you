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

  test "name is not null" do
    check @user, :name, nil
  end

  test "email is not null" do
    check @user, :email, nil
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

end
