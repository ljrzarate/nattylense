class PaymentsController < ApplicationController
  require 'mercadopago'

  before_action :authenticate_user!
  
  def new
    @payment = Payment.new
  end

  def create
    sdk = Mercadopago::SDK.new(ENV['MERCADO_PAGO_SDK'])
    result = sdk.payment.create(payments_params)
    @payment = result[:response]
  end

  private

  def payments_params
    params.permit(:transaction_amount, :description, :payment_method)
  end
end
