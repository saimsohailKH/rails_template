# == Schema Information
#
# Table name: carts
#
#  id               :bigint           not null, primary key
#  line_items_count :integer          default(0), not null
#  status           :integer          default("active"), not null
#  sub_total        :decimal(10, 2)   default(0.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Cart < ApplicationRecord
  STATUS = {
    active: 0,
    completed: 1,
  }.freeze

  validates :status, :sub_total, :line_items_count, presence: true

  belongs_to :user, class_name: 'Client::User'

  has_many :line_items, dependent: :destroy

  enum status: STATUS
end
