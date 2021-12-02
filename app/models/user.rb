class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthables
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :cart, dependent: :destroy # creates assoication as user has one cart

  def current_cart # creats current cart if not created else declares self.cart.
    if self.cart.nil?
      self.create_cart(user_id: self.id)
    end
    self.cart
  end


end
