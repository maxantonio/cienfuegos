require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "users should respond to name" do
    assert_respond_to users(:tim), :name
  end

  test "should not save without name" do
    user = users(:tim)
    user.name = ""
    assert_not user.valid?
  end

  test "when name is to long" do
    user = users(:tim)
    user.name = 'z' * 41
    assert_not user.valid?
  end

end
