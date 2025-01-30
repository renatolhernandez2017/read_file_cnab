# frozen_string_literal: true

module Mercadopago
  class GatewayController < ApplicationController
    skip_before_action :verify_authenticity_token

    def callback
      order_invoice
    end

    protected

    def order_invoice
      sale = sale_from_params

      if sale.present? && params["type"] == "payment"
        sale.update(status: "paid")
        sale.cart.update(status: "paid", status_detail: StatusDetail.find_by(status: "cart_payment"))
        # sale.transfers.update_all(status: "paid")
      end

      # html = render_to_string(partial: "carts/confirmation", locals: {step: 4, sale: sale})
      # ActionCable.server.broadcast("payment_status_#{sale.id}", {html: html})

      head :ok
    end

    private

    def sale_from_params
      Sale.find_by(transaction_id: params["data"]["id"])
    end
  end
end
