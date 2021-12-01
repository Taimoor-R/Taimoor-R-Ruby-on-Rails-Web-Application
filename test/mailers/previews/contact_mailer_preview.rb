# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("timmy@me.com",
      "Timmy Tommorow", "1234567890", @message = "Hello")
  end
end
