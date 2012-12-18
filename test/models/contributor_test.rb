require 'test_helper'

class ContributorTest < ActiveSupport::TestCase
  setup do
    @contributor = Contributor.new(
      owner: owners(:kennyj),
      repository: repositories(:kennyj_java_bin),
      contributions: 999
    )
  end

  test "repository is not null" do
    check @contributor, :repository, nil
  end

  test "owner is not null" do
    check @contributor, :owner, nil
  end

  test "contributions is not null" do
    check @contributor, :contributions, nil
  end

  test "contributor belongs to owner" do
    assert @contributor.owner.is_a?(User)
  end

  test "contributor belongs to repository" do
    assert @contributor.repository.is_a?(Repository)
  end
end
