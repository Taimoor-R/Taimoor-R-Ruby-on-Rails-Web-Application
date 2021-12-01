class ApplicationMailer < ActionMailer::Base
  default to: from:'tr00564@surrey.ac.uk', from: 'from@example.com'
  layout 'mailer'
end
