class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com' #sets defalut email from specified email
  layout 'mailer'
end
