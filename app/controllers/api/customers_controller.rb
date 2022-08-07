class Api::CustomersController < ApplicationController
  require "byebug"
  skip_before_action :authorized, only: [:create]
  before_action :set_customer, only: [:show, :update, :destroy ]
 
  # GET /customers
  def index
    @customers = Customer.all
    render json: @customers
  end

  # GET /customers/1
  def show
    render json: @customer
  end

  # POST /customers
  def create
    
     @customer = Customer.create!(customer_params)
     
    if @customer.valid?
      @token = encode_token(customer: @customer.id)
      render json: { customer: CustomerSerializer.new(@customer), jwt: @token }, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.permit(:name, :email, :password)
    end
end
