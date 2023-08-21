ActiveAdmin.register FormulaIngredient do
  belongs_to :formula

  permit_params :ingredient_id, :percentage, :formula_id, :index
end
