class LineItemsController < ApplicationController
  include CurrentCart # INCLUDED CURRENTCART HELPER MODULE TO SET CURRENT CART TO CURRENT USER_CART
  before_action :authenticate_user! # authenticates user before making LINEITEMS AND LIMITS access
  before_action :set_cart, only: [:create] #SETS CART
  before_action :set_line_item, only: [:show, :edit, :update, :destroy] #sets line items beforeactiosn
  before_action :set_line_item, only: %i[ show edit update destroy ]


  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    # if current product in question has supply more then or equal to 1
    #then in update product table and decrement product supply in table by 1 as it has been added to lineitems
    product = Product.find(params[:product_id])
    if product.supply >= 1
      x = product.supply-1
      Product.update(params[:product_id],supply: x) # updates product supply by decremting 1
      @line_item = @cart.add_product(product)
      respond_to do |format|
        if @line_item.save
          format.html {} #redirect makes page repload hence we leave it e
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    else # if product supply is less then 1 then redirect to hompage as item is out of stock
      redirect_to homepage_index_url
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
