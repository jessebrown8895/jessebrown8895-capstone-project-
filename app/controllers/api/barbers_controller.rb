class Api::BarbersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :set_barber, only: [:show, :update, :destroy]
  
  # GET /barbers
  def index
    @barbers = Barber.all

    render json: @barbers
  end

  # GET /barbers/1
  def show
    render json: @barber
  end

  # POST /barbers
  def create
     @barber = Barber.create!(barber_params)
    if @barber.valid?
      @token = encode_token(barber_id: @barber.id)
      render json: { barber: Barber.new(@barber), jwt: @token }, status: :created
    else
      render json: @barber.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barbers/1
  def update
    if @barber.update(barber_params)
      render json: @barber
    else
      render json: @barber.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barbers/1
  def destroy
    @barber.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barber
      @barber = Barber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barber_params
      params.permit(:name, :email, :password, :bio)
    end
end
