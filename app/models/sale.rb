class Sale < ApplicationRecord
  include StatusDetailManageable
  include Countable

  belongs_to :user, optional: true
  belongs_to :cart, optional: true
  belongs_to :guest, optional: true
  belongs_to :client, optional: true

  has_one :payment

  has_many :transfers, dependent: :destroy
end
