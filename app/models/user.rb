# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(256)
#  password_digest :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def secret_token
    JWT.encode({ id: id }, Rails.application.credentials.hmac_secret,
                           Rails.application.credentials.jwt_algorithm)
  end

  def admin?
    instance_of?(Admin::User)
  end

  def client?
    instance_of?(Client::User)
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    user && user.authenticate(password) ? user : nil
  end
end
