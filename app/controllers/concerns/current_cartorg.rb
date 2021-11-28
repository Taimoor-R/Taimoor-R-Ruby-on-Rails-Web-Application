module CurrentCart
  private
    def set_cart
        if current_user.present?
          @cart = current_user.current_cart
        else
          @cart = Cart.find(session[:cart_id])
          if !@cart && current_user
            @cart = Cart.find_by(user_id: current_user.id)
          end
          if @cart && current_user && @cart.user_id.nil?
            @cart.update(user_id: current_user.id)
          end
        end
    rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
  end
