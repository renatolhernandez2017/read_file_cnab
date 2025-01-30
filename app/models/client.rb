class Client < ApplicationRecord
  include StatusDetailManageable
  include Countable

  belongs_to :user, optional: true
end
