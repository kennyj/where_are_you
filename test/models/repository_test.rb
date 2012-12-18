require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  setup do
    @repository = Repository.new(
      github_id: 9999999999,
      name: "bar",
      full_name: "kennyj/bar",
      user_id: users(:kennyj).id,
      description: "bar is dummy project",
      fork: true,
      homepage: "http://bar.com"
    )
  end

  test "github_id is not null" do
    check @repository, :github_id, nil
  end

  test "name is not null" do
    check @repository, :name, nil
  end

  test "full_name is not null" do
    check @repository, :full_name, nil
  end

  test "user is not null" do
    check @repository, :user, nil
  end

  test "fork is not null" do
    check @repository, :fork, nil
  end

  test "github_id is uniqueness" do
    check @repository, :github_id, repositories(:kennyj_java_bin).github_id
  end

  test "full_name is uniqueness" do
    check @repository, :full_name, repositories(:kennyj_java_bin).full_name
  end

  test "repository belongs to user" do
    assert @repository.user.is_a?(User)
  end

  test "user has many contributors" do
    assert @repository.contributors.empty?
  end

end