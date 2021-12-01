class HomepageController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:category)
  end
  def contact

  end
  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]
    if email.blank?
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      ContactMailer.contact_email(email, name, telephone, message).deliver_now
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end
    redirect_to homepage_index_url
  end
end
