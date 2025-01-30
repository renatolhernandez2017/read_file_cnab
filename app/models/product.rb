class Product < ApplicationRecord
  include StatusDetailManageable
  include Countable

  belongs_to :user

  validates :description, :price, :image, presence: true
end
