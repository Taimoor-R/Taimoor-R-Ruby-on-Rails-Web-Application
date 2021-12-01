# helper modlue to sent current cart to current users current cart but not used please refer to other helper method
module CurrentCart
  private
    def set_cart # if current user is present then set current cart to current _user.current cart
        if current_user.present?
          @cart = current_user.current_cart
        else # if user not signed in or not active then create new cart
          @cart = Cart.find(session[:cart_id])
          if !@cart && current_user # if cart not found and current user exists then find cart by user id
            @cart = Cart.find_by(user_id: current_user.id)
          end
          if @cart && current_user && @cart.user_id.nil? # else if cart exisits and current_user exists but cart. user id is nil then update cart.user id using cart.update method
            @cart.update(user_id: current_user.id)
          end
        end
    rescue ActiveRecord::RecordNotFound # if active record not found create new cart 
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
  end
