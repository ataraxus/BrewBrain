class Formula < ApplicationRecord
  has_many_attached :images
  has_many_attached :attachments
  has_many :formula_steps
  has_many :formula_ingredients
  belongs_to :formula_category, optional: true

  accepts_nested_attributes_for :formula_steps
  accepts_nested_attributes_for :formula_ingredients

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "state", "updated_at", "formula_category_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["formula_category"]
  end
end
