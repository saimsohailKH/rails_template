# == Schema Information
#
# Table name: order_details
#
#  id            :bigint           not null, primary key
#  customer_name :string           not null
#  line1         :string           not null
#  line2         :string
#  phone_number  :string           not null
#  postal_code   :string           not null
#  street        :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order_id      :bigint           not null
#
# Indexes
#
#  index_order_details_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
class OrderDetail < ApplicationRecord
  validates :line1, :phone_number, :postal_code, :customer_name, :street, presence: true

  belongs_to :order
end
