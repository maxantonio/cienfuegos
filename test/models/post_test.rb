require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "should not save without a title" do
    post = posts(:paper)
    post.title = ""
    assert_not post.valid?
  end

  test "when title is too short or too long" do
    post = posts(:paper)

    post.title = 'z' * 3
    assert_not post.valid?, 'title is too short'

    post.title = 'z' * 51
    assert_not post.valid?, 'title is too long'
  end

  test "should not save without a body" do
    post = posts(:paper)
    post.body = ""
    assert_not post.valid?
  end

  test "when body is too short" do
    post = posts(:paper)
    post.body = 'z' * 18
    assert_not post.valid?
  end

end
