module V1
  module Client
    class CreateLineItem
      include Interactor

      delegate :cart_id, :product_id, :quantity, to: :context

      before do
        ensure_positive_quantity
        ensure_presence_of_product_id
        ensure_presence_of_cart_id
      end

      def call
        calculate_sub_total

        line_item.save
      end

      private

      def calculate_sub_total
        cart.update(sub_total: product.price * line_item.quantity)
      end

      def product
        @product ||= Product.find_by(id: product_id)
      end

      def cart
        @cart ||= Cart.find_by(id: cart_id)
      end

      def line_item
        @line_item ||= cart.line_items.new(product_id: product.id, quantity: quantity)
      end

      def ensure_positive_quantity
        context.fail!(error: 'quantity must be greater than 1') if quantity < 1
      end

      def ensure_presence_of_product_id
        context.fail!(error: 'Product must exists') unless product
      end

      def ensure_presence_of_cart_id
        context.fail!(error: 'Cart must exists') unless cart
      end
    end
  end
end
