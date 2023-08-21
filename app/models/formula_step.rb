class FormulaStep < ApplicationRecord
  belongs_to :formula

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "formula_id", "id", "name", "updated_at", "step_number"]
  end
end
