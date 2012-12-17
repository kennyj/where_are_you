require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
  setup do
    @contributor = Contributor.new(
      repository_id: repositories(:kennyj_java_bin).id,
      user_id: users(:kennyj).id,
      contributions: 999
    )
  end

  test "repository is not null" do
    @contributor.repository_id = nil
    assert !@contributor.valid?
    assert_equal 1, @contributor.errors.size
  end

  test "user is not null" do
    @contributor.user_id = nil
    assert !@contributor.valid?
    assert_equal 1, @contributor.errors.size
  end

  test "contributions is not null" do
    @contributor.contributions = nil
    assert !@contributor.valid?
    assert_equal 1, @contributor.errors.size
  end

  test "contributor belongs to user" do
    assert @contributor.user.is_a?(User)
  end

  test "contributor belongs to repository" do
    assert @contributor.repository.is_a?(Repository)
  end

end
