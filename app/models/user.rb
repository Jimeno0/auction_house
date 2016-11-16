class User < ApplicationRecord
  has_many :products
  validates :email, uniqueness: true
end
