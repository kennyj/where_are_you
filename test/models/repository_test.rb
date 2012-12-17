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
    @repository.github_id = nil
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "name is not null" do
    @repository.name = nil
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "full_name is not null" do
    @repository.full_name = nil
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "user is not null" do
    @repository.user = nil
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "fork is not null" do
    @repository.fork = nil
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "github_id is uniqueness" do
    @repository.github_id = repositories(:kennyj_java_bin).github_id
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "full_name is uniqueness" do
    @repository.full_name = repositories(:kennyj_java_bin).full_name
    assert !@repository.valid?
    assert_equal 1, @repository.errors.size
  end

  test "repository belongs to user" do
    assert @repository.user.is_a?(User)
  end

  test "user has many contributors" do
    assert @repository.contributors.empty?
  end

end
