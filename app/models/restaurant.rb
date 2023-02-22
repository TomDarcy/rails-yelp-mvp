class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  #   A restaurant must have at least a name, an address and a category.
  #   The restaurant category should belong to a fixed list ["chinese", "italian", "japanese", "french", "belgian"]
  CATEGORY = %w[chinese italian japanese french belgian].freeze
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
