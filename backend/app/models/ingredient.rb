class Ingredient < ApplicationRecord
  enum ingredient_type: {open: 0, closed: 1}

  has_many_attached :images
  has_many_attached :attachments
  has_many :assets, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "ingredient_type", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
