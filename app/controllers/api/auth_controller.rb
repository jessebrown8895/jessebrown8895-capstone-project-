class Api::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login_barber, :login_customer ]

  def login_barber
    @barber = Barber.find_by(email: barber_login_params[:email])
    #User#authenticate comes from BCrypt
    if @barber && @barber.authenticate(barber_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ barber_id: @barber.id })
      render json: { barber: BarberSerializer.new(@barber), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def login_customer
    @customer = Customer.find_by(email: customer_login_params[:email])
    if @customer && @customer.authenticate(customer_login_params[:password])
      token = encode_token({ customer_id: @customer.id })
      render json: { user: CustomerSerializer.new(@customer), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end
  private

  def barber_login_params
    params.permit(:email, :password)
  end

  def customer_login_params
    params.permit(:email, :password)
  end
end
