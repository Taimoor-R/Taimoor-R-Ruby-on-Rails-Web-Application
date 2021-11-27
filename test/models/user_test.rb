require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test " Save empty User" do
    user1 = User.new
    user1.save
    refute user1.valid?
  end
  test " Save Valid User" do
    user1 = User.new
    user1.email = 'course@work.com'
    user1.password = 'Bfdsugusgisogh123'
    user1.save
    assert user1.valid?
  end
  test " No Users with same email" do
    user1 = User.new
    user1.email = 'course@work.com'
    user1.password = 'Bfdsugusgisogh123'
    user1.save
    user2 = User.new
    user2.email = 'course@work.com'
    user2.password = 'Bfdsugusgisogh123'
    user2.save
    refute user2.valid?
  end
end
