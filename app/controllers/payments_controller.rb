class PaymentsController < ApplicationController
  # before_action :authenticate_user!

  # def new
  #   @payment = Payment.new
  # end

  def create
  end

  private

  def payments_params
    params.permit(:transaction_amount, :description, :payment_method)
  end
end
