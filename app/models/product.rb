# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string(256)      not null
#  price       :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_one_attached :image

  validates :name, :description, :price, presence: true
end
