class ApplicationMailer < ActionMailer::Base
  validates :name,:email,:telephone,:message, presence: true 
  default from: 'from@example.com' #sets defalut email from specified email
  layout 'mailer'
end
