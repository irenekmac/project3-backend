class User < ApplicationRecord

  has_many :restaurants

  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :name, presence: true

end
