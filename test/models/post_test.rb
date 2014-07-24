require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "should not save without a title" do
    post = posts(:paper)
    post.title = ""
    assert_not post.valid?
  end

end
