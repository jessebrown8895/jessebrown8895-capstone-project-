class ProductPurchasesController < ApplicationController
  before_action :set_product_purchase, only: [:show, :update, :destroy]

  # GET /product_purchases
  def index
    @product_purchases = ProductPurchase.all

    render json: @product_purchases
  end

  # GET /product_purchases/1
  def show
    render json: @product_purchase
  end

  # POST /product_purchases
  def create
    @product_purchase = ProductPurchase.new(product_purchase_params)

    if @product_purchase.save
      render json: @product_purchase, status: :created, location: @product_purchase
    else
      render json: @product_purchase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_purchases/1
  def update
    if @product_purchase.update(product_purchase_params)
      render json: @product_purchase
    else
      render json: @product_purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_purchases/1
  def destroy
    @product_purchase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_purchase
      @product_purchase = ProductPurchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_purchase_params
      params.require(:product_purchase).permit(:purchase, :product, :cost)
    end
end
