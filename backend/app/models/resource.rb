class Resource < ApplicationRecord
  enum state: {closed: 0, open: 1, consumed: 2}

  belongs_to :ingredient
  has_many_attached :attachments
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["amount_in_kg", "created_at", "description", "id", "ingredient_id", "lot_number", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["ingredient"]
  end
end
