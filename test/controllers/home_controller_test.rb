require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "owner/repo" do
  end

  test "owner/repo.json" do
  end

  test "language" do
    get 'index', owner: 'kennyj', repo: 'java_bin'
    assert_equal 'en', assigns[:language]

    get 'index', owner: 'kennyj', repo: 'java_bin', language: 'ja'
    assert_equal 'ja', assigns[:language]

    @request.env["HTTP_ACCEPT_LANGUAGE"] = "es"
    get 'index', owner: 'kennyj', repo: 'java_bin'
    assert_equal 'es', assigns[:language]
  end

  # test "the truth" do
  #   assert true
  # end
end
