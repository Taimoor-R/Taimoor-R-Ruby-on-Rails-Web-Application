class ContactMailer < ApplicationMailer
  def contact_email(email, name, telephone, message) # sets the @email to email typed by user in form and the same for the rest of the feilds
    @email = email # sets email typed in from to @email
    @name = name # sets name typed in from to @name
    @telephone = telephone # sets telephone typed in from to @telephone
    @message = message # sets message typed in from to @message
    mail cc: @email
  end
end
