class FormulaIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :formula

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "formula_id", "id", "ingredient_id", "percentage", "updated_at"]
  end
end
