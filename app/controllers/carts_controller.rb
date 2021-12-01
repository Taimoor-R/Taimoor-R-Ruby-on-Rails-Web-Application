class CartsController < ApplicationController
  before_action :authenticate_user! # authenticates user before making cart
  before_action :set_cart, only: %i[ show edit update destroy ]
  # redurects user to homepage if they try to acess anyone elses cart
  before_action do
    redirect_to homepage_index_url unless @cart && current_user && current_user.cart.id == @cart.id # checls for current_user.cart.id with the cart.id entered and if false then redirects to homepage
  end
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart # rescues form active record not found by invoking invalid cart method described in the bottom of the file
  # GET /carts or /carts.json
  def index # idexes all carts to @cart
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show

  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    # this lines are added to find the products before the cart is emptied and restore the supply that was taken form products to the cart.
    # so if in products table product a has a supply of 10 and user puts 3 of this product in his cart the supply in product table will change form 10 to 7 and this action returns the 3 items in cart when cart is emptied
    @cart.line_items.each do |item|
      product = Product.find(item['product_id'])
      product.update_columns(supply: product.supply + item.quantity) # updates the product supply by returning products to table
    end
    if current_user.present? # if current user is present then cart is initalized to be current_user cart and then through current_user.current_cart is detroyed.
      @cart = current_user.current_cart
      current_user.current_cart.destroy
    end
    @cart.destroy if @cart.id == session[:cart_id] # cart is destroyed if session cart id is equal to current cart id
    current_user.current_cart.destroy
    session[:cart_id] = nil # session id is made to be nil to remove the cart session
    respond_to do |format|
      format.html { redirect_to homepage_index_url, notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart # if attept to acess invalid cart it will give error and send the user back to homepage
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to homepage_index_url, notice: 'Invalid cart'
    end
end
