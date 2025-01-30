class Guest < ApplicationRecord
  include StatusDetailManageable
  include Countable
  include PgSearch::Model

  belongs_to :user, optional: true

  validates :name, presence: true

  validates :mobile, presence: true, if: :validating_for_update_presence?

  pg_search_scope :search_global,
    against: [:name],
    using: {
      tsearch: {
        prefix: true,
        any_word: true, # Busca qualquer palavra do nome
        dictionary: "portuguese"
      }
    },
    order_within_rank: "name",
    ignoring: :accents

  pg_search_scope :exact_match,
    against: [:name],
    using: {
      tsearch: {
        prefix: true,
        any_word: false,
        dictionary: "portuguese"
      }
    },
    ignoring: :accents

  private

  def validating_for_update_presence?
    validation_context == :update_presence
  end
end
