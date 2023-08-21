ActiveAdmin.register FormulaStep do
  belongs_to :formula

  permit_params :name, :description, :formula_id, :step_number
end
