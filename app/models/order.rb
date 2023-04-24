# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0), not null
#  total      :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_cart_id  (cart_id)
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  STATUS = {
    pending: 0,
    processing: 1,
    shipped: 2,
    delivered: 3,
    cancelled: 4,
    refunded: 5,
  }.freeze

  validates :total, :status, presence: true

  belongs_to :user
  belongs_to :cart

  has_one :order_detail, dependent: :destroy

  enum status: STATUS
end
