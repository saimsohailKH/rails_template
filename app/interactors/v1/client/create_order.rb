module V1
  module Client
    class CreateOrder
      include Interactor

      before do
        ensure_presence_of_cart
      end

      delegate :cart_id, :current_user, :line1, :line2, :postal_code, :phone_number,
               :customer_name, to: :context

      def call
        calculate_total
        save_order
        mark_cart_as_complete
        order
      end

      private

      def calculate_total
        line_items.each { |line_item| order.total += line_item.sub_total }
      end

      def mark_cart_as_complete
        cart.completed!
      end

      def save_order
        ActiveRecord::Base.transaction do
          order.save
          create_order_detail
        end

        context.fail! unless order.presisted?
      end

      def cart
        @cart ||= Cart.find_by(id: cart_id)
      end

      def line_items
        @line_items ||= cart.line_items
      end

      def order
        @order ||= current_user.orders.new(cart: cart)
      end

      def create_order_detail
        OrderDetail.create(order_id: order.id, line1: line1, line2: line2,
                           phone_number: phone_number, customer_name: customer_name,
                           postal_code: postal_code)
      end

      def ensure_presence_of_cart
        context.fail!(error: 'Cart must be present') unless cart
      end
    end
  end
end
