class Api::V1::PaymentsController < ApplicationController
  def create

    @amount = payment_params[:amount].to_i

    customer = Stripe::Customer.create(
        email: payment_params[:email],
        source: payment_params[:token]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Best kimchistan order',
        currency: 'sek'
    )

    render json: {charge: charge}

  rescue => error
    render json: {error: error.message}, status: 400
  end

  private

  def payment_params
    params[:data][:attributes]
  end
end

