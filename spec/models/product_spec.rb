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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
