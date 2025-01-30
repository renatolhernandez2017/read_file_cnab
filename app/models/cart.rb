class Cart < ApplicationRecord
  include StatusDetailManageable
  include Countable

  belongs_to :status_detail, optional: true
  belongs_to :guest, optional: true
  belongs_to :client, optional: true
  belongs_to :user, optional: true

  has_many :cart_items, dependent: :destroy

  has_one :sale, dependent: :destroy

  # state_machine :status, initial: :cart_start do
  #   after_transition cart_start: :cart_information, do: :change_status
  #   after_transition cart_information: :cart_payment, do: :change_status
  #   after_transition cart_payment: :cart_confirmation, do: :change_status

  #   event :next_cart_status do
  #     transition cart_start: :cart_information
  #     transition cart_information: :cart_payment
  #     transition cart_payment: :cart_confirmation
  #   end
  # end
end
