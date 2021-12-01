class HomepageController < ApplicationController
  include CurrentCart # INCLUDED CURRENTCART HELPER MODULE TO SET CURRENT CART TO CURRENT USER_CART
  before_action :set_cart #SETS CARTTS
  def index
    @products = Product.order(:category) # GETS PRODUCTS FILTERED BY THEIR category
  end
  def contact # MADE FOR MAILER AND CONTACT PAGE

  end
  def request_contact #MADE FOR MAILER AND CONTACT PAGE
    name = params[:name] #NAME AND PRAMS
    email = params[:email] # EMAIL AND PARAMS
    telephone = params[:telephone] #TELEPHONE AND PARAMS
    message = params[:message] #MESSAGE AND PARAMS
    if email.blank? # IF EMAIL IS BLANK FLASH ALERT IS PRODUCED
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now # SEND EMAIL NOT CONNECTED TO STMP YET
      flash[:notice] = I18n.t('home.request_contact.email_sent') #NOTICE THAT MAILER HAS BEEN SENT
    end
    redirect_to homepage_index_url #AFTER MAIL HAS BEEN SENT REDIRECTS TO HOMEPAGE
  end
end
