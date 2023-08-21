class FormulaIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :formula
end
