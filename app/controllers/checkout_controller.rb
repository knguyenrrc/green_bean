class CheckoutController < ApplicationController
  # def create
  #   # establish a connection to Stripe and then redirect the user to the payment screen
  #   product = Product.find(params[:product_id])

  #   if product.nil?
  #     redirect_to root_path
  #     return
  #   end

  #   @session = Stripe::Checkout::Session.create(
  #     payment_method_types: ["card"],
  #     success_url: checkout_success_url
  #       + "?session_id={CHECKOUT_SESSION_ID}",
  #     cancel_url: checkout_cancel_url,
  #     line_items: [
  #       {
  #           price_data: {
  #               currency: "cad",
  #               unit_amount: 50,
  #               product_data: {
  #                   name: product.product_name,
  #                   description: product.description,
  #               },
  #               tax_behavior: "exclusive",
  #           },
  #           quantity: 1,
  #       }
  #     ],
  #   #   automatic_tax: {
  #   #     enabled: true,
  #   #   },
  #       mode: "payment",
  #   )

  #   respond_to do | format |
  #     format.js #app/views/checkout/create.js.erb
  #   end
  # end

  def success
    # we took the customer's money
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # something went wrong with payment!
  end
end
