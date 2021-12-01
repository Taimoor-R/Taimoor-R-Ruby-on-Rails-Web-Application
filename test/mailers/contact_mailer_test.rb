require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return contact email" do
    mail = ContactMailer.contact_email("timmy@me.com",
      "Timmy Tommorow", "1234567890", @message = "Hello")
      assert_equal ['info@MCMWebstore.com'], mail.to
      assert_equal ['info@MCMWebstore.com'], mail.from
    end
end
