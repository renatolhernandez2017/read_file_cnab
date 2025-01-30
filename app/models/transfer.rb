class Transfer < ApplicationRecord
  belongs_to :sale, optional: true
end
