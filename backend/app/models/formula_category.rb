class FormulaCategory < ApplicationRecord
  has_many :formula, dependent: :nullify

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["formula"]
  end
end
