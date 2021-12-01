class ApplicationMailer < ActionMailer::Base
  default from:'tr00564@surrey.ac.uk', to: 'from@example.com' # sets default mailer from admin(tr00564@surrey.ac.uk) to sample user
  layout 'mailer'
end
