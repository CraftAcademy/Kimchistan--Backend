class Api::V1::OrdersController < ApplicationController

  def create
    pickup_time = Time.now + 30.minutes
    customer_email = params[:data][:attributes][:email]
    cart = params[:data][:attributes][:cart]
    OrderMailer.order(customer_email, cart, pickup_time)
    render :json
  end
end