require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  setup do
    @repository = Repository.new(
      github_id: 9999999999,
      name: "bar",
      full_name: "kennyj/bar",
      owner: owners(:kennyj),
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

  test "owner is not null" do
    check @repository, :owner, nil
  end

  test "fork is not null" do
    skip
    check @repository, :fork, nil
  end

  test "github_id is uniqueness" do
    check @repository, :github_id, repositories(:kennyj_java_bin).github_id
  end

  test "full_name is uniqueness" do
    check @repository, :full_name, repositories(:kennyj_java_bin).full_name
  end

  test "repository belongs to owner" do
    assert @repository.owner.is_a?(User)
  end

  test "repository has many contributors" do
    assert @repository.contributors.empty?
  end

  test "create from api" do
    User.stubs(:create_or_update_from_api).returns(owners(:kennyj))
    repo = Repository.create_or_update_from_api("kennyj/where_are_you")
    assert repo.persisted?
    assert_equal "kennyj/where_are_you", repo.full_name
  end

  test "update from api" do
    User.stubs(:create_or_update_from_api).returns(owners(:kennyj))
    repo = Repository.create_or_update_from_api("kennyj/java_bin")
    assert repo.persisted?
    assert_equal "kennyj/java_bin", repo.full_name
  end

  test "invalid repo" do
    assert_raise(ActiveRecord::RecordNotFound) { Repository.create_or_update_from_api("kennyj/xxx") }
  end

  test "refresh_contributors_from_api" do
    repo = repositories(:kennyj_java_bin)
    assert_difference("User.count", 2) do
      repo.refresh_contributors_from_api
      assert repo.contributors.size >= 3
    end
    assert_no_difference("Contributor.count") do
      repo.refresh_contributors_from_api
    end
  end
end
