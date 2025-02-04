module HashLinkManageable
  extend ActiveSupport::Concern

  included do
    before_create :generate_hash_link

    validates :hash_link, uniqueness: true
  end

  private

  def generate_hash_link
    self.hash_link = Array.new(4) { rand(36).to_s(36) }.join.upcase
  end
end
