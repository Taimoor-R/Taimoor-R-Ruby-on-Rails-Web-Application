module CurrentCart
  private
    def set_cart
        if current_user.present?
          @cart = current_user.current_cart
        end
      end
end
