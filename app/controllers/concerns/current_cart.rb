module CurrentCart
# helper modlue to sent current cart to current users current cart
  private
    def set_cart
        if current_user.present? # if user present then create/ refer cart to curretn_user.cart 
          @cart = current_user.current_cart
        end
      end
end
