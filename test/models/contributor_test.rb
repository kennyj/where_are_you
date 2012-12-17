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
    check @contributor, :repository_id, nil
  end

  test "user is not null" do
    check @contributor, :user_id, nil
  end

  test "contributions is not null" do
    check @contributor, :contributions, nil
  end

  test "contributor belongs to user" do
    assert @contributor.user.is_a?(User)
  end

  test "contributor belongs to repository" do
    assert @contributor.repository.is_a?(Repository)
  end
end
